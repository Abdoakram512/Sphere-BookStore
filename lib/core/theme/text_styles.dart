import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/core/utils/app_fonts.dart';

/// Text styles for the application.
///
/// - **Headings** use Open Sans (via GoogleFonts)
/// - **Body** text uses Roboto (via GoogleFonts)
class AppTextStyles {
  const AppTextStyles._();

  // ──────────────────────────────────────────────────────────────────────────
  // Private helpers
  // ──────────────────────────────────────────────────────────────────────────

  static TextStyle _style({
    required double fontSize,
    required FontWeight fontWeight,
    required String fontFamily,
    Color color = AppColors.charcoal,
    double? height,
  }) {
    return TextStyle(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily,
      height: height,
    );
  }

  static TextStyle _heading({required double size, FontWeight? weight}) =>
      _style(
        fontSize: size,
        fontWeight: weight ?? AppFonts.bold,
        fontFamily: GoogleFonts.openSans().fontFamily!,
      );

  static TextStyle _body({required double size, FontWeight? weight}) => _style(
    fontSize: size,
    fontWeight: weight ?? AppFonts.regular,
    fontFamily: GoogleFonts.roboto().fontFamily!,
  );

  // ──────────────────────────────────────────────────────────────────────────
  // Heading Styles (Open Sans)
  // ──────────────────────────────────────────────────────────────────────────

  static TextStyle get h1Bold => _heading(size: AppFonts.h1);
  static TextStyle get h2Bold => _heading(size: AppFonts.h2);
  static TextStyle get h3Bold => _heading(size: AppFonts.h3);
  static TextStyle get h4Bold => _heading(size: AppFonts.h4);
  static TextStyle get h5Bold => _heading(size: AppFonts.h5);
  static TextStyle get h6Bold => _heading(size: AppFonts.h6);

  // ──────────────────────────────────────────────────────────────────────────
  // Body Styles (Roboto)
  // ──────────────────────────────────────────────────────────────────────────

  static TextStyle get bodyXLargeMedium =>
      _body(size: AppFonts.bodyXL, weight: AppFonts.medium);
  static TextStyle get bodyLargeSemiBold =>
      _body(size: AppFonts.bodyL, weight: AppFonts.semiBold);
  static TextStyle get bodyLargeMedium =>
      _body(size: AppFonts.bodyL, weight: AppFonts.medium);
  static TextStyle get bodySmallSemiBold =>
      _body(size: AppFonts.bodyS, weight: AppFonts.semiBold);
  static TextStyle get bodySmallMedium =>
      _body(size: AppFonts.bodyS, weight: AppFonts.medium);
  static TextStyle get bodySmallRegular =>
      _body(size: AppFonts.bodyS, weight: AppFonts.regular);

  // // =============================================================================
  // // BuildContext extension — access styles via context.h1Bold, etc.
  // // =============================================================================

  // extension TextStylesExtension on BuildContext {
  //   // Headings
  //   TextStyle get h1Bold => AppTextStyles.h1Bold;
  //   TextStyle get h2Bold => AppTextStyles.h2Bold;
  //   TextStyle get h3Bold => AppTextStyles.h3Bold;
  //   TextStyle get h4Bold => AppTextStyles.h4Bold;
  //   TextStyle get h5Bold => AppTextStyles.h5Bold;
  //   TextStyle get h6Bold => AppTextStyles.h6Bold;

  //   // Body
  //   TextStyle get bodyXLargeMedium => AppTextStyles.bodyXLargeMedium;
  //   TextStyle get bodyLargeSemiBold => AppTextStyles.bodyLargeSemiBold;
  //   TextStyle get bodyLargeMedium => AppTextStyles.bodyLargeMedium;
  //   TextStyle get bodySmallSemiBold => AppTextStyles.bodySmallSemiBold;
  //   TextStyle get bodySmallMedium => AppTextStyles.bodySmallMedium;
  //   TextStyle get bodySmallRegular => AppTextStyles.bodySmallRegular;

  //   // Legacy / Screen-specific
  //   TextStyle get font23Bold => AppTextStyles.font23Bold;
  //   TextStyle get font23Medium => AppTextStyles.font23Medium;
  //   TextStyle get font20Bold => AppTextStyles.font20Bold;
  //   TextStyle get font19Bold => AppTextStyles.font19Bold;
  //   TextStyle get font15SemiBold => AppTextStyles.font15SemiBold;
  //   TextStyle get font15Medium => AppTextStyles.font15Medium;
  //   TextStyle get font15Regular => AppTextStyles.font15Regular;
  //   TextStyle get font14Bold => AppTextStyles.font14Bold;
  //   TextStyle get font14Regular => AppTextStyles.font14Regular;
  //   TextStyle get font13Medium => AppTextStyles.font13Medium;
  //   TextStyle get font13Regular => AppTextStyles.font13Regular;
  // }
}
