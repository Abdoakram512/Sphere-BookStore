import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sphere_book_app/core/utils/app_fonts.dart';

/// Text styles for the application
///
/// Use AppTextStyles to create consistent text widgets across the app.
/// Renamed from AppTextStyles to AppTextStyles for better clarity.
class AppTextStyles {
  const AppTextStyles({
    required this.data,
    this.textColor = Colors.white,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.selectionColor,
    this.semanticsLabel,
    this.textDirection,
    this.textWidthBasis,
    this.textScaler,
    this.textDecoration,
    this.wordSpacing,
    this.letterSpacing,
    this.lineHeight,
    this.fontFamily,
  });

  final String data;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? selectionColor;
  final String? semanticsLabel;
  final TextDirection? textDirection;
  final TextWidthBasis? textWidthBasis;
  final TextScaler? textScaler;
  final TextDecoration? textDecoration;
  final double? wordSpacing, letterSpacing;
  final double? lineHeight;
  final String? fontFamily;

  Text _font({required FontWeight fontWeight, required double fontSize}) {
    return Text(
      data,
      softWrap: true,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      selectionColor: selectionColor,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      textWidthBasis: textWidthBasis,
      textScaler: textScaler,
      style: TextStyle(
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
        color: textColor,
        decoration: textDecoration,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
        height: lineHeight,
      ),
    );
  }

  /// Display Font Sizes:
  Text displayLB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.displayL);
  Text displayLSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.displayL);
  Text displayLM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.displayL);
  Text displayLR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.displayL);

  Text displayMB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.displayM);
  Text displayMSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.displayM);
  Text displayMM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.displayM);
  Text displayMR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.displayM);

  Text displaySB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.displayS);
  Text displaySSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.displayS);
  Text displaySM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.displayS);
  Text displaySR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.displayS);

  /// Heading Font Sizes:
  Text h0B() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.h0);
  Text h0SB() => _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.h0);
  Text h0M() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.h0);
  Text h0R() => _font(fontWeight: AppFonts.regular, fontSize: AppFonts.h0);

  Text h1LB() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.h1L);
  Text h1LSB() => _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.h1L);
  Text h1LM() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.h1L);
  Text h1LR() => _font(fontWeight: AppFonts.regular, fontSize: AppFonts.h1L);

  Text h1B() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.h1);
  Text h1SB() => _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.h1);
  Text h1M() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.h1);
  Text h1R() => _font(fontWeight: AppFonts.regular, fontSize: AppFonts.h1);

  Text h2B() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.h2);
  Text h2SB() => _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.h2);
  Text h2M() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.h2);
  Text h2R() => _font(fontWeight: AppFonts.regular, fontSize: AppFonts.h2);

  Text h3B() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.h3);
  Text h3SB() => _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.h3);
  Text h3M() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.h3);
  Text h3R() => _font(fontWeight: AppFonts.regular, fontSize: AppFonts.h3);

  Text h4B() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.h4);
  Text h4SB() => _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.h4);
  Text h4M() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.h4);
  Text h4R() => _font(fontWeight: AppFonts.regular, fontSize: AppFonts.h4);

  Text h5B() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.h5);
  Text h5SB() => _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.h5);
  Text h5M() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.h5);
  Text h5R() => _font(fontWeight: AppFonts.regular, fontSize: AppFonts.h5);

  Text h6B() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.h6);
  Text h6SB() => _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.h6);
  Text h6M() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.h6);
  Text h6R() => _font(fontWeight: AppFonts.regular, fontSize: AppFonts.h6);

  Text h7B() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.h7);
  Text h7SB() => _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.h7);
  Text h7M() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.h7);
  Text h7R() => _font(fontWeight: AppFonts.regular, fontSize: AppFonts.h7);
  Text h7L() => _font(fontWeight: AppFonts.light, fontSize: AppFonts.h7);

  /// Body Font Sizes:
  Text bodyXLB() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyXL);
  Text bodyXLSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyXL);
  Text bodyXLM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyXL);
  Text bodyXLR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.bodyXL);

  Text bodyLB() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyL);
  Text bodyLSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyL);
  Text bodyLM() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyL);
  Text bodyLR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.bodyL);

  Text bodyMB() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyM);
  Text bodyMSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyM);
  Text bodyMM() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyM);
  Text bodyMR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.bodyM);

  Text bodySB() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyS);
  Text bodySSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyS);
  Text bodySM() => _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyS);
  Text bodySR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.bodyS);

  Text bodyXSB() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.bodyXS);
  Text bodyXSSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.bodyXS);
  Text bodyXSM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.bodyXS);
  Text bodyXSR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.bodyXS);

  /// Labels & Buttons:
  Text buttonXXLB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.buttonXXL);
  Text buttonXXLSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.buttonXXL);
  Text buttonXXLM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.buttonXXL);
  Text buttonXXLR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.buttonXXL);

  Text buttonXLB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.buttonXL);
  Text buttonXLSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.buttonXL);
  Text buttonXLM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.buttonXL);
  Text buttonXLR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.buttonXL);

  Text buttonLB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.buttonL);
  Text buttonLSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.buttonL);
  Text buttonLM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.buttonL);
  Text buttonLR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.buttonL);

  Text buttonMB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.buttonM);
  Text buttonMSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.buttonM);
  Text buttonMM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.buttonM);
  Text buttonMR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.buttonM);

  Text buttonSB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.buttonS);
  Text buttonSSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.buttonS);
  Text buttonSM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.buttonS);
  Text buttonSR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.buttonS);

  Text buttonXSB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.buttonXS);
  Text buttonXSSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.buttonXS);
  Text buttonXSM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.buttonXS);
  Text buttonXSR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.buttonXS);

  Text labelXLB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.labelXL);
  Text labelXLSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.labelXL);
  Text labelXLM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.labelXL);
  Text labelXLR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.labelXL);

  Text labelLB() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.labelL);
  Text labelLSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.labelL);
  Text labelLM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.labelL);
  Text labelLR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.labelL);

  Text labelMB() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.labelM);
  Text labelMSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.labelM);
  Text labelMM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.labelM);
  Text labelMR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.labelM);

  Text labelSB() => _font(fontWeight: AppFonts.bold, fontSize: AppFonts.labelS);
  Text labelSSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.labelS);
  Text labelSM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.labelS);
  Text labelSR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.labelS);

  Text labelXSB() =>
      _font(fontWeight: AppFonts.bold, fontSize: AppFonts.labelXS);
  Text labelXSSB() =>
      _font(fontWeight: AppFonts.semiBold, fontSize: AppFonts.labelXS);
  Text labelXSM() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.labelXS);
  Text labelXSR() =>
      _font(fontWeight: AppFonts.regular, fontSize: AppFonts.labelXS);

  /// Caption, Overline & Tiny:
  Text size13M() =>
      _font(fontWeight: AppFonts.medium, fontSize: AppFonts.size13);
}
