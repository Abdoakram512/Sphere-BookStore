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
    required String fontName,
    Color color = AppColors.grey900,
    double? height,
  }) {
    return GoogleFonts.getFont(
      fontName,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }

  static TextStyle _heading({required double size, FontWeight? weight}) =>
      _style(
        fontSize: size,
        fontWeight: weight ?? AppFonts.bold,
        fontName: 'Open Sans',
      );

  static TextStyle _body({required double size, FontWeight? weight}) => _style(
    fontSize: size,
    fontWeight: weight ?? AppFonts.regular,
    fontName: 'Roboto',
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

  static TextStyle get h32Bold => _heading(size: AppFonts.size32);
  static TextStyle get h30Bold => _heading(size: AppFonts.size30);
  static TextStyle get h25Bold => _heading(size: AppFonts.size25);
  static TextStyle get h20Bold => _heading(size: AppFonts.size20);

  static TextStyle get h16Bold =>
      _heading(size: AppFonts.h6, weight: AppFonts.bold);
  static TextStyle get h16Medium =>
      _heading(size: AppFonts.h6, weight: AppFonts.medium);
  static TextStyle get h16Regular =>
      _heading(size: AppFonts.h6, weight: AppFonts.regular);

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

  static TextStyle get body32Bold =>
      _body(size: AppFonts.size32, weight: AppFonts.bold);

  static TextStyle get body32Medium =>
      _body(size: AppFonts.size32, weight: AppFonts.medium);
  static TextStyle get body30Medium =>
      _body(size: AppFonts.size30, weight: AppFonts.medium);
  static TextStyle get body25Medium =>
      _body(size: AppFonts.size25, weight: AppFonts.medium);
  static TextStyle get body20Medium =>
      _body(size: AppFonts.size20, weight: AppFonts.medium);

  static TextStyle get body14Medium =>
      _body(size: AppFonts.size14, weight: AppFonts.medium);

  static TextStyle get body16Medium =>
      _body(size: AppFonts.bodyL, weight: AppFonts.medium);

  static TextStyle get body16Regular =>
      _body(size: AppFonts.bodyL, weight: AppFonts.regular);
}

// =============================================================================
// BuildContext extension — access styles via context.h1Bold, etc.
// =============================================================================

extension TextStylesExtension on BuildContext {
  // Headings
  TextStyle get h1Bold => AppTextStyles.h1Bold;
  TextStyle get h2Bold => AppTextStyles.h2Bold;
  TextStyle get h3Bold => AppTextStyles.h3Bold;
  TextStyle get h4Bold => AppTextStyles.h4Bold;
  TextStyle get h5Bold => AppTextStyles.h5Bold;
  TextStyle get h6Bold => AppTextStyles.h6Bold;

  TextStyle get h32Bold => AppTextStyles.h32Bold;
  TextStyle get h30Bold => AppTextStyles.h30Bold;
  TextStyle get h25Bold => AppTextStyles.h25Bold;
  TextStyle get h20Bold => AppTextStyles.h20Bold;
  TextStyle get h16Bold => AppTextStyles.h16Bold;
  TextStyle get h16Medium => AppTextStyles.h16Medium;
  TextStyle get h16Regular => AppTextStyles.h16Regular;

  // Body
  TextStyle get bodyXLargeMedium => AppTextStyles.bodyXLargeMedium;
  TextStyle get bodyLargeSemiBold => AppTextStyles.bodyLargeSemiBold;
  TextStyle get bodyLargeMedium => AppTextStyles.bodyLargeMedium;
  TextStyle get bodySmallSemiBold => AppTextStyles.bodySmallSemiBold;
  TextStyle get bodySmallMedium => AppTextStyles.bodySmallMedium;
  TextStyle get bodySmallRegular => AppTextStyles.bodySmallRegular;

  TextStyle get body32Bold => AppTextStyles.body32Bold;
  TextStyle get body32Medium => AppTextStyles.body32Medium;
  TextStyle get body30Medium => AppTextStyles.body30Medium;
  TextStyle get body25Medium => AppTextStyles.body25Medium;
  TextStyle get body20Medium => AppTextStyles.body20Medium;
  TextStyle get body14Medium => AppTextStyles.body14Medium;
  TextStyle get body16Medium => AppTextStyles.body16Medium;
  TextStyle get body16Regular => AppTextStyles.body16Regular;
}
