import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sphere_book_app/core/components/social_auth_button.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/core/utils/app_icons.dart';

class SocialAuthSection extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;

  const SocialAuthSection({
    super.key,
    required this.onGoogleTap,
    required this.onAppleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.grey200, thickness: 1)),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
              child: Text(
                'Or with',
                style: AppTextStyles.body14Medium.copyWith(
                  color: AppColors.grey500,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.grey200, thickness: 1)),
          ],
        ),
        SizedBox(height: 24.h),
        SocialAuthButton(
          onTap: onGoogleTap,
          text: 'Sign in with Google',
          icon: AppIcons.google,
        ),
        SizedBox(height: 12.h),
        SocialAuthButton(
          onTap: onAppleTap,
          text: 'Sign in with Apple',
          icon: AppIcons.apple,
        ),
      ],
    );
  }
}
