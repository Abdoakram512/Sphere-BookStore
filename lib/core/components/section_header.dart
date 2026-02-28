import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';

Widget sectionHeader(BuildContext context, {required String title}) {
  return Row(
    children: [
      GestureDetector(
        onTap: () {
          if (context.canPop()) {
            context.pop();
          }
        },
        child: Icon(Icons.arrow_back_ios_new_sharp, size: 20.r),
      ),
      SizedBox(width: 10.w),
      AppTextStyles(
        data: title.tr(),
        textColor: AppColors.black,
        lineHeight: 1.0,
      ).h5R(),
    ],
  );
}
