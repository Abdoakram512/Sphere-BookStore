import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sphere_book_app/core/theme/text_styles.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/core/utils/app_fonts.dart';

/// Main theme configuration for the application
class AppTheme {
  const AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.roboto().fontFamily,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        secondary: AppColors.green,
        surface: AppColors.white,
        error: AppColors.red,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.black,
        onError: AppColors.white,
      ),

      // Scaffold
      scaffoldBackgroundColor: AppColors.white,

      // App Bar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.bodyLargeMedium.copyWith(
          color: AppColors.black,
        ),
      ),

      // Text Theme — uses AppTextStyles for consistency
      textTheme: TextTheme(
        displayLarge: AppTextStyles.h1Bold.copyWith(color: AppColors.black),
        displayMedium: AppTextStyles.h2Bold.copyWith(color: AppColors.black),
        displaySmall: AppTextStyles.h3Bold.copyWith(color: AppColors.black),
        headlineLarge: AppTextStyles.h1Bold.copyWith(color: AppColors.black),
        headlineMedium: AppTextStyles.h2Bold.copyWith(
          fontWeight: AppFonts.semiBold,
          color: AppColors.black,
        ),
        headlineSmall: AppTextStyles.h3Bold.copyWith(
          fontWeight: AppFonts.medium,
          color: AppColors.black,
        ),
        titleLarge: AppTextStyles.h4Bold.copyWith(
          fontWeight: AppFonts.semiBold,
          color: AppColors.black,
        ),
        titleMedium: AppTextStyles.h5Bold.copyWith(
          fontWeight: AppFonts.medium,
          color: AppColors.black,
        ),
        titleSmall: AppTextStyles.h6Bold.copyWith(
          fontWeight: AppFonts.medium,
          color: AppColors.black,
        ),
        bodyLarge: AppTextStyles.bodyLargeMedium.copyWith(
          fontWeight: AppFonts.regular,
          color: AppColors.black,
        ),
        bodyMedium: AppTextStyles.bodyLargeMedium.copyWith(
          color: AppColors.black,
        ),
        bodySmall: AppTextStyles.bodySmallRegular.copyWith(
          color: AppColors.greyText,
        ),
        labelLarge: AppTextStyles.bodyLargeMedium.copyWith(
          fontWeight: AppFonts.medium,
          color: AppColors.black,
        ),
        labelMedium: AppTextStyles.bodySmallMedium.copyWith(
          color: AppColors.black,
        ),
        labelSmall: AppTextStyles.bodySmallRegular.copyWith(
          color: AppColors.greyText,
        ),
      ),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.grey50, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.grey50, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.black, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColors.red, width: 2),
        ),
        hintStyle: AppTextStyles.bodyLargeMedium.copyWith(
          color: AppColors.black,
        ),
        labelStyle: AppTextStyles.bodyLargeMedium.copyWith(
          color: AppColors.black,
        ),
        errorStyle: AppTextStyles.bodySmallRegular.copyWith(
          color: AppColors.red,
        ),
      ),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
          elevation: 2,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: AppTextStyles.bodyLargeSemiBold,
        ),
      ),

      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.all(8.w),
      ),

      // Icon Theme
      iconTheme: IconThemeData(color: AppColors.black, size: 24.w),

      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.grey50,
        thickness: 1,
        space: 1,
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return lightTheme.copyWith(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
    );
  }
}
