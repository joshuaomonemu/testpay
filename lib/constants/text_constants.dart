import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/constants/color_constants.dart';

class ProjectText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final Color? textColor;
  final TextAlign? textAlign;
  final bool? softWrap;
  final int? maxLines;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;

  const ProjectText({
    key,
    required this.fontSize,
    this.letterSpacing,
    required this.text,
    this.textColor,
    this.height,
    this.softWrap,
    this.textAlign,
    this.maxLines,
    this.fontStyle,
    this.fontWeight,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines ?? 20,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
      softWrap: softWrap ?? true,
      style: GoogleFonts.inter(
        textStyle: TextStyle(
          fontSize: fontSize!,
          fontStyle: fontStyle,
          height: height,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: textColor ?? blackText,
          letterSpacing: letterSpacing ?? 0.3,
        ),
      ),
    );
  }
}

class NurQuestArabText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final double? letterSpacing;
  final double? height;
  final Color? textColor;
  final TextAlign? textAlign;
  final bool? softWrap;
  final int? maxLines;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final TextDecoration? textDecoration;

  const NurQuestArabText({
    Key? key,
    required this.fontSize,
    this.letterSpacing,
    required this.text,
    this.textColor,
    this.height,
    this.softWrap,
    this.textAlign,
    this.maxLines,
    this.fontStyle,
    this.fontWeight,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines ?? 20,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.right,
      softWrap: softWrap ?? true,
      style: GoogleFonts.unifrakturCook(
        textStyle: TextStyle(
          fontSize: fontSize!,
          fontStyle: fontStyle,
          height: height,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: textColor ?? blackText,
          letterSpacing: letterSpacing ?? 0.3,
        ),
      ),
    );
  }
}
