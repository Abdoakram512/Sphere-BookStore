import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sphere_book_app/core/config/routes/route_constants.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';

class NavigationHeader extends StatelessWidget {
  final String? title;
  final VoidCallback? onTap;
  const NavigationHeader({super.key, this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap:
              onTap ??
              () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  // Root screen: back to primary home tab
                  context.go(ordersScreen);
                }
              },
          child: Container(
            width: 46.w,
            height: 46.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey50,
            ),
            alignment: Alignment.center,
            child: Icon(Icons.arrow_back_ios_new, size: 15.sp),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          child: Text(
            title?.tr() ?? '',
            style: context.locale.languageCode == 'ar'
                ? AppTextStyles.bodySmallRegular.copyWith(
                    color: AppColors.black,
                  )
                : AppTextStyles.bodyLargeMedium.copyWith(
                    color: AppColors.black,
                  ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
