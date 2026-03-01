import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';

class SocialAuthButton extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onTap;

  const SocialAuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.grey900,
        side: const BorderSide(color: AppColors.grey200),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.r),
        ),
        minimumSize: Size(double.infinity, 56.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: 24.w, height: 24.h),
          SizedBox(width: 12.w),
          Text(
            text,
            style: AppTextStyles.body16Medium.copyWith(
              color: AppColors.grey900,
            ),
          ),
        ],
      ),
    );
  }
}
