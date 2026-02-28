import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';

void showImagePickerDialog({
  required BuildContext context,
  required VoidCallback onCameraTap,
  required VoidCallback onGalleryTap,
  required VoidCallback onDeleteTap,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
          child: AppTextStyles(
            data: 'add_picture'.tr(),
            textColor: AppColors.black,
          ).h5R(),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildImagePickerOption(
              context: context,
              label: 'upload_from_gallery'.tr(),
              icon: Icons.photo_library,
              onTap: onGalleryTap,
            ),
            SizedBox(height: 10.h),
            _buildImagePickerOption(
              context: context,
              label: 'upload_from_camera'.tr(),
              icon: Icons.camera_alt,
              onTap: onCameraTap,
            ),
            SizedBox(height: 10.h),
            _buildImagePickerOption(
              context: context,
              label: 'delete_image'.tr(),
              icon: Icons.delete,
              isDestructive: true,
              onTap: onDeleteTap,
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildImagePickerOption({
  required BuildContext context,
  required String label,
  required IconData icon,
  required VoidCallback onTap,
  bool isDestructive = false,
}) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
      onTap();
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey50, width: 1.5),
      ),
      child: Row(
        children: [
          Expanded(
            child: AppTextStyles(
              data: label,
              textColor: isDestructive ? Colors.red : AppColors.black,
            ).labelMB(),
          ),
          Icon(
            icon,
            color: isDestructive ? Colors.red : AppColors.black,
            size: 20.r,
          ),
        ],
      ),
    ),
  );
}
