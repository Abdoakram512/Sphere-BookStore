// import 'package:flutter/material.dart';

// /// Extensions for Widget to provide helpful utility methods
// extension WidgetExtensions on Widget {
//   // ============================================================================
//   // Padding Shortcuts
//   // ============================================================================

//   /// Add padding to all sides
//   Widget padding(EdgeInsetsGeometry padding) {
//     return Padding(padding: padding, child: this);
//   }

//   /// Add symmetric padding
//   Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
//       child: this,
//     );
//   }

//   /// Add padding to all sides with same value
//   Widget paddingAll(double padding) {
//     return Padding(padding: EdgeInsets.all(padding), child: this);
//   }

//   /// Add padding to specific sides
//   Widget paddingOnly({
//     double left = 0,
//     double top = 0,
//     double right = 0,
//     double bottom = 0,
//   }) {
//     return Padding(
//       padding: EdgeInsets.only(
//         left: left,
//         top: top,
//         right: right,
//         bottom: bottom,
//       ),
//       child: this,
//     );
//   }

//   // ============================================================================
//   // Visibility Shortcuts
//   // ============================================================================

//   /// Show or hide widget based on condition
//   Widget visible(bool isVisible, {Widget? placeholder}) {
//     return Visibility(
//       visible: isVisible,
//       replacement: placeholder ?? const SizedBox.shrink(),
//       child: this,
//     );
//   }

//   /// Conditionally show widget or return empty SizedBox
//   Widget showIf(bool condition) {
//     return condition ? this : const SizedBox.shrink();
//   }

//   // ============================================================================
//   // Alignment & Centering
//   // ============================================================================

//   /// Center the widget
//   Widget get center {
//     return Center(child: this);
//   }

//   /// Align the widget
//   Widget align(Alignment alignment) {
//     return Align(alignment: alignment, child: this);
//   }

//   /// Align to top left
//   Widget get alignTopLeft {
//     return Align(alignment: Alignment.topLeft, child: this);
//   }

//   /// Align to top center
//   Widget get alignTopCenter {
//     return Align(alignment: Alignment.topCenter, child: this);
//   }

//   /// Align to top right
//   Widget get alignTopRight {
//     return Align(alignment: Alignment.topRight, child: this);
//   }

//   /// Align to center left
//   Widget get alignCenterLeft {
//     return Align(alignment: Alignment.centerLeft, child: this);
//   }

//   /// Align to center right
//   Widget get alignCenterRight {
//     return Align(alignment: Alignment.centerRight, child: this);
//   }

//   /// Align to bottom left
//   Widget get alignBottomLeft {
//     return Align(alignment: Alignment.bottomLeft, child: this);
//   }

//   /// Align to bottom center
//   Widget get alignBottomCenter {
//     return Align(alignment: Alignment.bottomCenter, child: this);
//   }

//   /// Align to bottom right
//   Widget get alignBottomRight {
//     return Align(alignment: Alignment.bottomRight, child: this);
//   }

//   // ============================================================================
//   // Gesture Shortcuts
//   // ============================================================================

//   /// Add onTap gesture
//   Widget onTap(VoidCallback onTap, {HitTestBehavior? behavior}) {
//     return GestureDetector(onTap: onTap, behavior: behavior, child: this);
//   }

//   /// Add InkWell with onTap
//   Widget inkWell({
//     required VoidCallback onTap,
//     BorderRadius? borderRadius,
//     Color? splashColor,
//     Color? highlightColor,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: borderRadius,
//       splashColor: splashColor,
//       highlightColor: highlightColor,
//       child: this,
//     );
//   }

//   // ============================================================================
//   // Expansion & Sizing
//   // ============================================================================

//   /// Expand the widget
//   Widget get expand {
//     return Expanded(child: this);
//   }

//   /// Expand with flex
//   Widget expanded({int flex = 1}) {
//     return Expanded(flex: flex, child: this);
//   }

//   /// Add SizedBox with width and height
//   Widget sized({double? width, double? height}) {
//     return SizedBox(width: width, height: height, child: this);
//   }

//   /// Add specific width
//   Widget width(double width) {
//     return SizedBox(width: width, child: this);
//   }

//   /// Add specific height
//   Widget height(double height) {
//     return SizedBox(height: height, child: this);
//   }

//   /// Make widget square
//   Widget square(double size) {
//     return SizedBox(width: size, height: size, child: this);
//   }

//   // ============================================================================
//   // Decoration & Styling
//   // ============================================================================

//   /// Add Container decoration
//   Widget decorated({
//     Color? color,
//     DecorationImage? image,
//     BoxBorder? border,
//     BorderRadius? borderRadius,
//     List<BoxShadow>? boxShadow,
//     Gradient? gradient,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: color,
//         image: image,
//         border: border,
//         borderRadius: borderRadius,
//         boxShadow: boxShadow,
//         gradient: gradient,
//       ),
//       child: this,
//     );
//   }

//   /// Add Card wrapper
//   Widget card({
//     Color? color,
//     double? elevation,
//     ShapeBorder? shape,
//     EdgeInsetsGeometry? margin,
//   }) {
//     return Card(
//       color: color,
//       elevation: elevation,
//       shape: shape,
//       margin: margin,
//       child: this,
//     );
//   }

//   // ============================================================================
//   // Flexible & FittedBox
//   // ============================================================================

//   /// Make widget flexible
//   Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
//     return Flexible(flex: flex, fit: fit, child: this);
//   }

//   /// Wrap in FittedBox
//   Widget fitted({BoxFit fit = BoxFit.contain}) {
//     return FittedBox(fit: fit, child: this);
//   }

//   // ============================================================================
//   // Scrolling
//   // ============================================================================

//   /// Make widget scrollable
//   Widget get scrollable {
//     return SingleChildScrollView(child: this);
//   }

//   /// Make widget scrollable with custom scroll physics
//   Widget scrollableWith({ScrollPhysics? physics}) {
//     return SingleChildScrollView(physics: physics, child: this);
//   }

//   // ============================================================================
//   // Opacity & Shimmer
//   // ============================================================================

//   /// Add opacity to widget
//   Widget opacity(double opacity) {
//     return Opacity(opacity: opacity, child: this);
//   }

//   /// Rotate the widget
//   Widget rotate(double angle) {
//     return Transform.rotate(angle: angle, child: this);
//   }

//   /// Scale the widget
//   Widget scale(double scale) {
//     return Transform.scale(scale: scale, child: this);
//   }
// }
