import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sphere_book_app/core/utils/app_colors.dart';
import 'package:sphere_book_app/core/utils/app_fonts.dart';
import 'package:sphere_book_app/core/utils/app_strings.dart' as app_strings;

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final String? title;
  final String? errorText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixWidget;
  final String? prefixIconPath;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final int? maxLength;
  final int? maxLines;
  final double? borderRadius;
  final Color? borderColor;
  final Color? fillColor;
  final bool isShadowed;
  final bool isUnderLine;
  final bool noBorder;
  final bool withValidate;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  // Phone field specific
  final bool isPhoneField;
  final String initialCountryCode;
  final Function(String)? onPhoneChanged;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.title,
    this.errorText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixWidget,
    this.prefixIconPath,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
    this.borderRadius,
    this.borderColor,
    this.fillColor,
    this.isShadowed = false,
    this.isUnderLine = false,
    this.noBorder = false,
    this.withValidate = true,
    this.inputFormatters,
    this.validator,
    this.isPhoneField = false,
    this.initialCountryCode = 'SA',
    this.onPhoneChanged,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isVisible;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _isVisible = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: TextStyle(
              fontFamily: AppFonts.rubikFontFamily,
              fontWeight: AppFonts.semiBold,
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 8.h),
        ],
        Container(
          decoration: widget.isShadowed
              ? BoxDecoration(
                  color: widget.fillColor ?? AppColors.white,
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 12.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x1A000000),
                      offset: Offset(0, 2.h),
                      blurRadius: 10.r,
                    ),
                  ],
                )
              : null,
          child: widget.isPhoneField ? _buildPhoneField() : _buildTextField(),
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      controller: widget.controller,
      textAlign: TextAlign.right,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      initialCountryCode: widget.initialCountryCode,
      onChanged: (phone) {
        if (widget.onPhoneChanged != null) {
          widget.onPhoneChanged!(phone.completeNumber);
        }
        if (widget.onChanged != null) {
          widget.onChanged!(phone.completeNumber);
        }
      },
      style: _textStyle(),
      dropdownTextStyle: _textStyle(),
      decoration: _inputDecoration().copyWith(
        counterText: '',
        hintText: widget.hintText ?? '000-000-0000',
        hintTextDirection: ui.TextDirection.rtl,
      ),
      dropdownIconPosition: IconPosition.trailing,
      dropdownIcon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.black,
        size: 20.sp,
      ),
      showCountryFlag: true,
      showDropdownIcon: true,
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      controller: widget.controller,
      focusNode: _focusNode,
      obscureText: _isVisible,
      keyboardType: widget.keyboardType,
      readOnly: widget.readOnly,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onTapOutside: (_) => _focusNode.unfocus(),
      style: _textStyle(),
      validator: (value) {
        if (widget.withValidate && (value == null || value.isEmpty)) {
          return widget.errorText ?? app_strings.textFieldError.tr();
        }
        return widget.validator?.call(value);
      },
      decoration: _inputDecoration(),
    );
  }

  TextStyle _textStyle() {
    return TextStyle(
      fontFamily: AppFonts.appFontFamily,
      fontWeight: AppFonts.medium,
      fontSize: 14.sp,
      color: AppColors.black,
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      labelText: widget.labelText,
      labelStyle: TextStyle(
        color: AppColors.black,
        fontSize: 12.sp,
        fontFamily: AppFonts.appFontFamily,
        fontWeight: FontWeight.bold,
      ),
      hintText: widget.hintText,
      hintStyle: TextStyle(
        fontFamily: AppFonts.appFontFamily,
        fontWeight: AppFonts.regular,
        color: AppColors.black,
        fontSize: 14.sp,
      ),
      fillColor: widget.isShadowed ? Colors.transparent : widget.fillColor,
      filled: widget.fillColor != null || widget.isShadowed,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      prefixIcon: widget.prefixWidget ?? _buildPrefixIcon(),
      suffixIcon: widget.obscureText
          ? _buildVisibilityIcon()
          : widget.suffixIcon,
      border: _buildBorder(),
      enabledBorder: _buildBorder(),
      focusedBorder: _buildBorder(isFocused: true),
      errorBorder: _buildBorder(isError: true),
      focusedErrorBorder: _buildBorder(isError: true, isFocused: true),
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.prefixIconPath == null) return null;
    return Container(
      padding: EdgeInsets.all(12.r),
      child: SvgPicture.asset(
        widget.prefixIconPath!,
        width: 20.r,
        height: 20.r,
      ),
    );
  }

  Widget _buildVisibilityIcon() {
    return IconButton(
      onPressed: () => setState(() => _isVisible = !_isVisible),
      icon: Icon(
        _isVisible ? Icons.visibility : Icons.visibility_off,
        color: AppColors.black,
      ),
    );
  }

  InputBorder _buildBorder({bool isFocused = false, bool isError = false}) {
    if (widget.noBorder) return InputBorder.none;

    final Color color = isError
        ? AppColors.red
        : (isFocused
              ? (widget.borderColor ?? AppColors.black)
              : (widget.borderColor ?? AppColors.grey50));

    if (widget.isUnderLine) {
      return UnderlineInputBorder(borderSide: BorderSide(color: color));
    }

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 8.r),
      borderSide: widget.isShadowed && !isFocused && !isError
          ? BorderSide.none
          : BorderSide(color: color),
    );
  }
}
