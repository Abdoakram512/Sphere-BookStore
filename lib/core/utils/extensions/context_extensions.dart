import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sphere_book_app/core/utils/toast_helper.dart';

// =============================================================================
// App Dimensions — Design-token constants for spacing, radius, padding, etc.
// =============================================================================

/// Centralized dimension constants used across the app.
///
/// Usage: `AppDimensions.borderRadius8`, `AppDimensions.spacing16`, etc.
class AppDimensions {
  const AppDimensions._();

  // Border Radius
  static double get borderRadius4 => 4.r;
  static double get borderRadius8 => 8.r;
  static double get borderRadius12 => 12.r;
  static double get borderRadius16 => 16.r;
  static double get borderRadius20 => 20.r;
  static double get borderRadius24 => 24.r;
  static double get borderRadius32 => 32.r;

  // Spacing
  static double get spacing4 => 4.w;
  static double get spacing8 => 8.w;
  static double get spacing12 => 12.w;
  static double get spacing16 => 16.w;
  static double get spacing20 => 20.w;
  static double get spacing24 => 24.w;
  static double get spacing32 => 32.w;
  static double get spacing40 => 40.w;
  static double get spacing48 => 48.w;

  // Padding
  static double get paddingSmall => 8.w;
  static double get paddingMedium => 16.w;
  static double get paddingLarge => 24.w;
  static double get paddingXLarge => 32.w;

  // Icon Sizes
  static double get iconSizeSmall => 16.w;
  static double get iconSizeMedium => 24.w;
  static double get iconSizeLarge => 32.w;
  static double get iconSizeXLarge => 48.w;

  // Button Heights
  static double get buttonHeightSmall => 40.h;
  static double get buttonHeightMedium => 48.h;
  static double get buttonHeightLarge => 56.h;

  // Elevation
  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;
}

// =============================================================================
// Toast Extensions on BuildContext
// =============================================================================

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
