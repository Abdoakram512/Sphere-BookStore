import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sphere_book_app/core/utils/toast_helper.dart';

extension ContextExtensions on int {
  // ============================================================================
  // Border Radius
  // ============================================================================

  double get borderRadius4 => 4.r;
  double get borderRadius8 => 8.r;
  double get borderRadius12 => 12.r;
  double get borderRadius16 => 16.r;
  double get borderRadius20 => 20.r;
  double get borderRadius24 => 24.r;
  double get borderRadius32 => 32.r;

  // ============================================================================
  // Spacing
  // ============================================================================

  double get spacing4 => 4.w;
  double get spacing8 => 8.w;
  double get spacing12 => 12.w;
  double get spacing16 => 16.w;
  double get spacing20 => 20.w;
  double get spacing24 => 24.w;
  double get spacing32 => 32.w;
  double get spacing40 => 40.w;
  double get spacing48 => 48.w;

  // ============================================================================
  // Padding
  // ============================================================================

  double get paddingSmall => 8.w;
  double get paddingMedium => 16.w;
  double get paddingLarge => 24.w;
  double get paddingXLarge => 32.w;

  // ============================================================================
  // Icon Sizes
  // ============================================================================

  double get iconSizeSmall => 16.w;
  double get iconSizeMedium => 24.w;
  double get iconSizeLarge => 32.w;
  double get iconSizeXLarge => 48.w;

  // ============================================================================
  // Button Heights
  // ============================================================================

  double get buttonHeightSmall => 40.h;
  double get buttonHeightMedium => 48.h;
  double get buttonHeightLarge => 56.h;

  // ============================================================================
  // Elevation
  // ============================================================================

  double get elevationLow => 2.0;
  double get elevationMedium => 4.0;
  double get elevationHigh => 8.0;

  // ============================================================================
  // Toasts
  // ============================================================================
}

extension ToastExtensions on BuildContext {
  void showSuccessToast(String message) {
    ToastHelper.showToast(this, message: message, type: ToastType.success);
  }

  void showErrorToast(String message) {
    ToastHelper.showToast(this, message: message, type: ToastType.error);
  }

  void showWarningToast(String message) {
    ToastHelper.showToast(this, message: message, type: ToastType.warning);
  }

  void showInfoToast(String message) {
    ToastHelper.showToast(this, message: message, type: ToastType.info);
  }

  void showPendingToast(String message) {
    ToastHelper.showToast(
      this,
      message: message,
      type: ToastType.pending,
      duration: const Duration(seconds: 5),
    );
  }
}
