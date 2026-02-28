import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_animations.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.padding,
    this.fontSize,
    this.hasSuffixIcon = false,
    this.fontFamily,
    this.isLoading = false,
  });

  final String text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final bool hasSuffixIcon;
  final String? fontFamily;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        width: width ?? double.infinity,
        height: isLoading ? (height ?? 60.h) : (height ?? 56.h),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.black,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
              side: borderColor != null
                  ? BorderSide(color: borderColor!)
                  : BorderSide.none,
            ),
          ),
          child: isLoading
              ? Center(
                  child: Lottie.asset(
                    AppAnimations.sandyLoading,
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.contain,
                  ),
                )
              : Stack(
                  children: [
                    Center(
                      child: Text(
                        text.tr(),
                        style: AppTextStyles.font14Bold.copyWith(
                          color: textColor ?? AppColors.white,
                        ),
                      ),
                    ),
                    if (hasSuffixIcon)
                      Padding(
                        padding: EdgeInsetsDirectional.only(end: 15.w),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 24.sp,
                              color: backgroundColor ?? AppColors.black,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
