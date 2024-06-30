import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/constants/color_constants.dart';

class TextFieldBox extends StatelessWidget {
  final String? hintText;
  final String? label;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixColor;
  final Widget? prefixIcon;
  final bool? isCollapsed;
  final bool? isEnabled;
  final Function(String)? onChanged;
  final bool? autoFocus;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final Color? textColor;
  final bool? filled;
  final Color? fillColor;
  final int? maxLines;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final Color? prefixColor;
  final bool? autoCorrect;
  final bool? enableSuggestion;
  final List<TextInputFormatter>? inputFormatters;
  final double? fontSize;
  final double borderRadius;

  const TextFieldBox({
    Key? key,
    this.label,
    this.hintText,
    this.height,
    this.width,
    this.controller,
    this.validator,
    this.textColor,
    this.textInputAction,
    this.obscureText,
    this.suffixColor,
    this.prefixIcon,
    this.isCollapsed,
    this.isEnabled,
    this.onChanged,
    this.autoFocus,
    this.suffixIcon,
    this.hintStyle,
    this.filled,
    this.fillColor,
    this.maxLines,
    this.focusNode,
    this.onEditingComplete,
    this.borderColor,
    this.keyboardType,
    this.prefixColor,
    this.autoCorrect,
    this.enableSuggestion,
    this.inputFormatters,
    this.fontSize,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: TextFormField(
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        autocorrect: autoCorrect ?? true,
        enableSuggestions: enableSuggestion ?? true,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        focusNode: focusNode,
        maxLines: maxLines ?? 1,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
          fontSize: fontSize ?? 16.h,
          color: textColor ?? blackText,
          decoration: TextDecoration.none,
        ),
        obscureText: obscureText ?? false,
        cursorColor: darkGrayText,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.w),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixColor,
          fillColor: fillColor ?? Colors.white,
          filled: filled ?? true,
          labelText: label,
          floatingLabelStyle: TextStyle(color: purpleButton),
          labelStyle: TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,
            fontSize: 26.h,
            color: const Color(0xFF7A757F),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? grayBorder,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: grayBorder,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius.r),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius.r),
            ),
          ),
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
                fontSize: 12.h,
                color: darkGrayText,
              ),
        ),
      ),
    );
  }
}

class SearchFieldBox extends StatelessWidget {
  final String? hintText;
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixColor;
  final Widget? prefixIcon;
  final bool? isCollapsed;
  final bool? isEnabled;
  final Function(String)? onChanged;
  final bool? autoFocus;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final Color? textColor;
  final bool? filled;
  final Color? fillColor;
  final int? maxLines;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final Color? prefixColor;
  final bool? autoCorrect;
  final bool? enableSuggestion;
  final List<TextInputFormatter>? inputFormatters;
  final double? fontSize;

  const SearchFieldBox({
    Key? key,
    this.hintText,
    this.height,
    this.width,
    this.controller,
    this.validator,
    this.textColor,
    this.textInputAction,
    this.obscureText,
    this.suffixColor,
    this.prefixIcon,
    this.isCollapsed,
    this.isEnabled,
    this.onChanged,
    this.autoFocus,
    this.suffixIcon,
    this.hintStyle,
    this.filled,
    this.fillColor,
    this.maxLines,
    this.focusNode,
    this.onEditingComplete,
    this.borderColor,
    this.keyboardType,
    this.prefixColor,
    this.autoCorrect,
    this.enableSuggestion,
    this.inputFormatters,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: TextFormField(
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        autocorrect: autoCorrect ?? true,
        enableSuggestions: enableSuggestion ?? true,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        focusNode: focusNode,
        maxLines: maxLines ?? 1,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
          fontSize: fontSize ?? 16.h,
          color: textColor ?? blackText,
          decoration: TextDecoration.none,
        ),
        obscureText: obscureText ?? false,
        cursorColor: blackText,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.w),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixColor,
          fillColor: fillColor ?? fadePink,
          filled: filled ?? true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? fadePink,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: fadePink,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: fadePink,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30.r),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30.r),
            ),
          ),
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
                fontSize: 16.h,
                color: darkGrayText,
              ),
        ),
      ),
    );
  }
}

class AmountTextFieldBox extends StatelessWidget {
  final String? hintText;
  final String? label;
  final double? height;
  final double? width;
  final double? horizontal;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Widget? suffixColor;
  final Widget? prefixIcon;
  final bool? isCollapsed;
  final bool? isEnabled;
  final Function(String)? onChanged;
  final bool? autoFocus;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final Color? textColor;
  final Color? labelColor;
  final bool? filled;
  final Color? fillColor;
  final int? maxLines;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final Color? borderColor;
  final TextInputType? keyboardType;
  final Color? prefixColor;
  final bool? autoCorrect;
  final bool? enableSuggestion;
  final List<TextInputFormatter>? inputFormatters;
  final double? fontSize;

  AmountTextFieldBox({
    Key? key,
    this.hintText,
    this.height,
    this.width,
    this.label,
    this.controller,
    this.validator,
    this.textColor,
    this.labelColor,
    this.horizontal,
    this.textInputAction,
    this.obscureText,
    this.suffixColor,
    this.prefixIcon,
    this.isCollapsed,
    this.isEnabled,
    this.onChanged,
    this.autoFocus,
    this.suffixIcon,
    this.hintStyle,
    this.filled,
    this.fillColor,
    this.maxLines,
    this.focusNode,
    this.onEditingComplete,
    this.borderColor,
    this.keyboardType,
    this.prefixColor,
    this.autoCorrect,
    this.enableSuggestion,
    this.inputFormatters,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: TextFormField(
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        autocorrect: autoCorrect ?? true,
        enableSuggestions: enableSuggestion ?? true,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        focusNode: focusNode,
        maxLines: maxLines ?? 1,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        style: TextStyle(
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,
          fontSize: fontSize ?? 14.h,
          color: textColor ?? purpleButton,
          decoration: TextDecoration.none,
        ),
        obscureText: obscureText ?? false,
        cursorColor: purpleButton,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: horizontal ?? 24.h, vertical: 18.w),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          prefixIconColor: prefixColor,
          fillColor: fillColor ?? Colors.white,
          filled: filled ?? true,
          labelText: label,
          floatingLabelStyle: TextStyle(color: labelColor ?? purpleButton),
          labelStyle: TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,
            fontSize: 14.h,
            color: const Color(0xFF7A757F),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? purpleButton,
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: purpleButton,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xFF7A757F),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12.r),
            ),
          ),
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
                fontSize: 14.h,
                color: const Color(0xFF7A757F),
              ),
        ),
      ),
    );
  }
}

class DropdownBox extends StatelessWidget {
  final String? hintText;
  final String? label;
  final double? height;
  final double? width;
  final String? value;
  final List<DropdownMenuItem<String>>? items;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool? isExpanded;
  final Widget? icon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool? filled;
  final Color? borderColor;
  final double borderRadius;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;

  const DropdownBox({
    Key? key,
    this.hintText,
    this.label,
    this.height,
    this.width,
    this.value,
    this.items,
    this.onChanged,
    this.validator,
    this.isExpanded,
    this.icon,
    this.prefixIcon,
    this.fillColor,
    this.filled,
    this.borderColor,
    this.borderRadius = 8.0,
    this.textStyle,
    this.hintStyle,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: DropdownButtonFormField<String>(
        value: value,
        items: items,
        onChanged: onChanged,
        validator: validator,
        isExpanded: isExpanded ?? true,
        icon: icon,
        decoration: InputDecoration(
          contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 24.h, vertical: 18.w),
          prefixIcon: prefixIcon,
          fillColor: fillColor ?? Colors.white,
          filled: filled ?? true,
          labelText: label,
          floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
          labelStyle: TextStyle(
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w400,
            fontSize: 16.h,
            color: const Color(0xFF7A757F),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFFE5E5E5),
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? const Color(0xFFE5E5E5),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius.r),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius.r),
            ),
          ),
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
                fontSize: 12.h,
                color: const Color(0xFF7A757F),
              ),
        ),
        style: textStyle ??
            TextStyle(
              fontFamily: 'SFProDisplay',
              fontWeight: FontWeight.w400,
              fontSize: 16.h,
              color: const Color(0xFF000000),
            ),
      ),
    );
  }
}
