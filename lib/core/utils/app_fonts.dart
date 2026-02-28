import 'package:flutter/material.dart';

/// Centralized font weight and size constants for the application.
///
/// Font families are managed by GoogleFonts in [AppTextStyles]:
/// - **Open Sans** → Headings
/// - **Roboto** → Body text
class AppFonts {
  const AppFonts._();

  // ──────────────────────────────────────────────────────────────────────────
  // Font Weights
  // ──────────────────────────────────────────────────────────────────────────

  static const FontWeight black = FontWeight.w900;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight thin = FontWeight.w100;

  // ──────────────────────────────────────────────────────────────────────────
  // Display Sizes
  // ──────────────────────────────────────────────────────────────────────────

  static const double displayL = 57;
  static const double displayM = 45;
  static const double displayS = 36;

  // ──────────────────────────────────────────────────────────────────────────
  // Heading Sizes (Open Sans)
  // ──────────────────────────────────────────────────────────────────────────

  static const double h1 = 40;
  static const double h2 = 32;
  static const double h3 = 24; // also used as size23 ≈ 24
  static const double h4 = 20;
  static const double h5 = 18;
  static const double h6 = 16;

  // ──────────────────────────────────────────────────────────────────────────
  // Body Sizes (Roboto)
  // ──────────────────────────────────────────────────────────────────────────

  static const double bodyXL = 18;
  static const double bodyL = 16;
  static const double bodyM = 14;
  static const double bodyS = 12;
  static const double bodyXS = 10;

  // ──────────────────────────────────────────────────────────────────────────
  // Labels & Buttons
  // ──────────────────────────────────────────────────────────────────────────

  static const double buttonXXL = 24;
  static const double buttonXL = 20;
  static const double buttonL = 18;
  static const double buttonM = 16;
  static const double buttonS = 14;
  static const double buttonXS = 12;

  static const double labelXL = 16;
  static const double labelL = 14;
  static const double labelM = 12;
  static const double labelS = 11;
  static const double labelXS = 10;

  // ──────────────────────────────────────────────────────────────────────────
  // Caption & Small Texts
  // ──────────────────────────────────────────────────────────────────────────

  static const double caption = 12;
  static const double size13 = 13;
  static const double overline = 10;
  static const double tiny = 8;

  // ──────────────────────────────────────────────────────────────────────────
  // Screen-Specific Sizes (from existing screens)
  // ──────────────────────────────────────────────────────────────────────────

  static const double size32 = 32;
  static const double size30 = 30;
  static const double size25 = 25;
  static const double size23 = 23;
  static const double size20 = 20;
  static const double size19 = 19;
  static const double size15 = 15;
  static const double size14 = 14;
}
