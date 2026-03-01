import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/core/utils/app_icons.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onBackTap;

  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 34.h),
        GestureDetector(
          onTap: onBackTap ?? () => Navigator.pop(context),
          child: SvgPicture.asset(AppIcons.arrowLeft),
        ),
        SizedBox(height: 24.h),
        Text(title, style: AppTextStyles.h3Bold),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: AppTextStyles.body16Regular.copyWith(color: AppColors.grey500),
        ),
      ],
    );
  }
}
