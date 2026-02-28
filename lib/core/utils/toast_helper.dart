import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/core/utils/app_fonts.dart';

enum ToastType { success, error, warning, info, pending }

class ToastHelper {
  static OverlayEntry? _overlayEntry;
  static Timer? _timer;

  static void showToast(
    BuildContext context, {
    required String message,
    required ToastType type,
    Duration duration = const Duration(seconds: 4),
  }) {
    _dismiss();

    // rootOverlay:true ensures we always find an Overlay even inside nested navigators
    final overlay = Overlay.of(context, rootOverlay: true);
    _insertToast(overlay, message: message, type: type, duration: duration);
  }

  /// Use this from non-widget contexts (e.g. interceptors) by passing
  /// the overlay from the navigator key: `navigatorKey.currentState?.overlay`
  static void showToastOnOverlay(
    OverlayState overlay, {
    required String message,
    required ToastType type,
    Duration duration = const Duration(seconds: 4),
  }) {
    _dismiss();
    _insertToast(overlay, message: message, type: type, duration: duration);
  }

  static void _insertToast(
    OverlayState overlay, {
    required String message,
    required ToastType type,
    required Duration duration,
  }) {
    _overlayEntry = OverlayEntry(
      builder: (ctx) => _ToastWidget(
        message: message,
        type: type,
        duration: duration,
        onDismiss: _dismiss,
      ),
    );

    overlay.insert(_overlayEntry!);
    _timer = Timer(duration + const Duration(milliseconds: 450), _dismiss);
  }

  static void _dismiss() {
    _timer?.cancel();
    _timer = null;
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

// ─── Toast Widget (Animation wrapper) ─────────────────────────────────────────

class _ToastWidget extends StatefulWidget {
  final String message;
  final ToastType type;
  final Duration duration;
  final VoidCallback onDismiss;

  const _ToastWidget({
    required this.message,
    required this.type,
    required this.duration,
    required this.onDismiss,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _scaleAnim = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) => widget.onDismiss());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 16.h,
      left: 14.w,
      right: 14.w,
      child: FadeTransition(
        opacity: _fadeAnim,
        child: SlideTransition(
          position: _slideAnim,
          child: ScaleTransition(
            scale: _scaleAnim,
            child: _ToastCard(
              message: widget.message,
              type: widget.type,
              duration: widget.duration,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Toast Card (UI) ──────────────────────────────────────────────────────────

class _ToastCard extends StatefulWidget {
  final String message;
  final ToastType type;
  final Duration duration;

  const _ToastCard({
    required this.message,
    required this.type,
    required this.duration,
  });

  @override
  State<_ToastCard> createState() => _ToastCardState();
}

class _ToastCardState extends State<_ToastCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..forward();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = _toastConfigs[widget.type]!;

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: ToastHelper._dismiss,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [
              BoxShadow(
                color: config.accentColor.withValues(alpha: 0.18),
                blurRadius: 30,
                spreadRadius: 0,
                offset: const Offset(0, 10),
              ),
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                spreadRadius: 0,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: config.accentColor.withValues(alpha: 0.12),
              width: 1.0,
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Gradient Accent Bar ────────────────────────────────────
                Container(
                  width: 6.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        config.accentColor,
                        config.accentColor.withValues(alpha: 0.55),
                      ],
                    ),
                  ),
                ),

                // ── Content Area ───────────────────────────────────────────
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(14.w, 14.h, 12.w, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header: icon bubble + title + close
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Icon with gradient background
                            Container(
                              width: 38.r,
                              height: 38.r,
                              decoration: BoxDecoration(
                                gradient: RadialGradient(
                                  colors: [
                                    config.accentColor.withValues(alpha: 0.18),
                                    config.accentColor.withValues(alpha: 0.06),
                                  ],
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: config.accentColor.withValues(
                                    alpha: 0.25,
                                  ),
                                  width: 1.2,
                                ),
                              ),
                              child: Icon(
                                config.icon,
                                color: config.accentColor,
                                size: 20.sp,
                              ),
                            ),

                            SizedBox(width: 10.w),

                            // Title
                            Expanded(
                              child: Text(
                                config.title,
                                style: TextStyle(
                                  fontWeight: AppFonts.semiBold,
                                  fontSize: AppFonts.bodyS.sp,
                                  color: config.accentColor,
                                  letterSpacing: 0.2,
                                ),
                              ),
                            ),

                            // Close button
                            GestureDetector(
                              onTap: ToastHelper._dismiss,
                              child: Container(
                                width: 24.r,
                                height: 24.r,
                                decoration: BoxDecoration(
                                  color: AppColors.grey50,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 13.sp,
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8.h),

                        // Divider
                        Divider(
                          thickness: 0.6,
                          height: 0,
                          color: AppColors.grey50,
                        ),

                        SizedBox(height: 8.h),

                        // Message
                        Text(
                          widget.message,
                          style: TextStyle(
                            fontWeight: AppFonts.regular,
                            fontSize: AppFonts.bodyXS.sp,
                            color: AppColors.black,
                            height: 1.55,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        // Auto-dismiss countdown bar
                        AnimatedBuilder(
                          animation: _progressController,
                          builder: (context2, snapshot) => ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: LinearProgressIndicator(
                              value: 1.0 - _progressController.value,
                              minHeight: 3.h,
                              backgroundColor: AppColors.grey50,
                              color: config.accentColor,
                            ),
                          ),
                        ),

                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Config ────────────────────────────────────────────────────────────────────

class _ToastConfig {
  final Color accentColor;
  final IconData icon;
  final String title;

  const _ToastConfig({
    required this.accentColor,
    required this.icon,
    required this.title,
  });
}

const _toastConfigs = {
  ToastType.success: _ToastConfig(
    accentColor: AppColors.blue,
    icon: Icons.check_circle_rounded,
    title: 'نجاح',
  ),
  ToastType.error: _ToastConfig(
    accentColor: AppColors.red,
    icon: Icons.cancel_rounded,
    title: 'خطأ',
  ),
  ToastType.warning: _ToastConfig(
    accentColor: AppColors.orange,
    icon: Icons.warning_amber_rounded,
    title: 'تنبيه',
  ),
  ToastType.info: _ToastConfig(
    accentColor: AppColors.black,
    icon: Icons.info_rounded,
    title: 'معلومة',
  ),
  ToastType.pending: _ToastConfig(
    accentColor: Color(0xFFE6A817),
    icon: Icons.hourglass_top_rounded,
    title: 'قيد المراجعة',
  ),
};
