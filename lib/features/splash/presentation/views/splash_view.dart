import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sphere_book_app/core/config/routes/route_constants.dart'
    as routes;
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/core/utils/app_icons.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        context.go(routes.onBoarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey900,
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(seconds: 3),
          curve: Curves.easeInOut,
          builder: (context, value, child) {
            return Transform.scale(
              scale: 0.8 + (value * 0.4),
              child: Opacity(opacity: value, child: child),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppIcons.appLogo),
              SizedBox(width: 12.w),
              Text(
                "Sphere",
                style: context.body32Bold.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
