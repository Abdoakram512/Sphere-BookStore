// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../constants/app_colors.dart';
// import '../constants/app_fonts.dart';

// /// Main theme configuration for the Tawfeer app
// class AppTheme {
//   /// Light theme configuration
//   static ThemeData get lightTheme {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,

//       // Color Scheme
//       colorScheme: ColorScheme.light(
//         primary: AppColors.primaryColor,
//         secondary: AppColors.green,
//         surface: AppColors.white,
//         error: AppColors.red,
//         onPrimary: AppColors.white,
//         onSecondary: AppColors.white,
//         onSurface: AppColors.textColor,
//         onError: AppColors.white,
//       ),

//       // Scaffold
//       scaffoldBackgroundColor: AppColors.white,

//       // App Bar
//       appBarTheme: AppBarTheme(
//         backgroundColor: AppColors.primaryColor,
//         foregroundColor: AppColors.white,
//         elevation: 0,
//         centerTitle: true,
//         titleTextStyle: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: 20.sp,
//           fontWeight: AppFonts.semiBold,
//           color: AppColors.white,
//         ),
//       ),

//       // Text Theme
//       textTheme: TextTheme(
//         displayLarge: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.displayL.sp,
//           fontWeight: AppFonts.bold,
//           color: AppColors.textColor,
//         ),
//         displayMedium: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.displayM.sp,
//           fontWeight: AppFonts.bold,
//           color: AppColors.textColor,
//         ),
//         displaySmall: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.displayS.sp,
//           fontWeight: AppFonts.bold,
//           color: AppColors.textColor,
//         ),
//         headlineLarge: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.h1.sp,
//           fontWeight: AppFonts.bold,
//           color: AppColors.textColor,
//         ),
//         headlineMedium: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.h2.sp,
//           fontWeight: AppFonts.semiBold,
//           color: AppColors.textColor,
//         ),
//         headlineSmall: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.h3.sp,
//           fontWeight: AppFonts.medium,
//           color: AppColors.textColor,
//         ),
//         bodyLarge: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.bodyL.sp,
//           fontWeight: AppFonts.regular,
//           color: AppColors.textColor,
//         ),
//         bodyMedium: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.bodyM.sp,
//           fontWeight: AppFonts.regular,
//           color: AppColors.textColor,
//         ),
//         bodySmall: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.bodyS.sp,
//           fontWeight: AppFonts.regular,
//           color: AppColors.greyText,
//         ),
//         labelLarge: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.labelL.sp,
//           fontWeight: AppFonts.medium,
//           color: AppColors.textColor,
//         ),
//         labelMedium: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.labelM.sp,
//           fontWeight: AppFonts.medium,
//           color: AppColors.textColor,
//         ),
//         labelSmall: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.labelS.sp,
//           fontWeight: AppFonts.regular,
//           color: AppColors.greyText,
//         ),
//       ),

//       // Input Decoration Theme
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppColors.white,
//         contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.r),
//           borderSide: BorderSide(color: AppColors.greyBorder, width: 1),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.r),
//           borderSide: BorderSide(color: AppColors.greyBorder, width: 1),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.r),
//           borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.r),
//           borderSide: BorderSide(color: AppColors.red, width: 1),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.r),
//           borderSide: BorderSide(color: AppColors.red, width: 2),
//         ),
//         hintStyle: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.bodyM.sp,
//           fontWeight: AppFonts.regular,
//           color: AppColors.hintTextColor,
//         ),
//         labelStyle: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.bodyM.sp,
//           fontWeight: AppFonts.regular,
//           color: AppColors.greyText,
//         ),
//         errorStyle: TextStyle(
//           fontFamily: AppFonts.appFontFamily,
//           fontSize: AppFonts.bodyS.sp,
//           fontWeight: AppFonts.regular,
//           color: AppColors.red,
//         ),
//       ),

//       // Elevated Button Theme
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppColors.primaryColor,
//           foregroundColor: AppColors.white,
//           elevation: 2,
//           padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.r),
//           ),
//           textStyle: TextStyle(
//             fontFamily: AppFonts.appFontFamily,
//             fontSize: AppFonts.buttonM.sp,
//             fontWeight: AppFonts.semiBold,
//           ),
//         ),
//       ),

//       // Card Theme
//       cardTheme: CardTheme(
//         color: AppColors.white,
//         elevation: 2,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.r),
//           borderSide: BorderSide(color: AppColors.cardBorder, width: 1),
//         ),
//         margin: EdgeInsets.all(8.w),
//       ),

//       // Icon Theme
//       iconTheme: IconThemeData(color: AppColors.darkBlue, size: 24.w),

//       // Divider Theme
//       dividerTheme: DividerThemeData(
//         color: AppColors.greyBorder,
//         thickness: 1,
//         space: 1,
//       ),
//     );
//   }

//   /// Dark theme configuration (optional - you can implement this later)
//   static ThemeData get darkTheme {
//     // This can be implemented later if dark mode is needed
//     return lightTheme.copyWith(
//       brightness: Brightness.dark,
//       scaffoldBackgroundColor: AppColors.backgroundDarkBlue,
//     );
//   }
// }
