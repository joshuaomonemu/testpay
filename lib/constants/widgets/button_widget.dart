import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/constants/asset_path.dart';
import 'package:payment_app/constants/text_constants.dart';
import 'package:payment_app/constants/color_constants.dart';

//************************************************************************************
//////////        LONG BUTTON WIDGET
//************************************************************************************
class ButtonWidget extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final double? width;
  final String? text;
  var border;

  ButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.width,
    this.radius,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 48,
      width: width ?? size.width,
      decoration: BoxDecoration(
        color: buttonColor!,
        borderRadius: BorderRadius.circular(radius ?? 25),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: Center(
        child: ProjectText(
          text: text!,
          textColor: textColor!,
          fontSize: 16,
        ),
      ),
    );
  }
}

//************************************************************************************
//////////        ARAB LONG BUTTON WIDGET
//************************************************************************************
class ArabButtonWidget extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final double? width;
  final String? text;
  var border;

  ArabButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.width,
    this.radius,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 48,
      width: width ?? size.width,
      decoration: BoxDecoration(
        color: buttonColor!,
        borderRadius: BorderRadius.circular(radius ?? 8),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: Center(
        child: NurQuestArabText(
          text: text!,
          textColor: textColor!,
          fontSize: 16,
        ),
      ),
    );
  }
}

//************************************************************************************
//////////        STACK BUTTON WIDGET
//************************************************************************************
class StackButtonWidget extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final double? width;
  final String? text;
  var border;

  StackButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.width,
    this.radius,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 48.sp,
          width: width ?? size.width,
          decoration: BoxDecoration(
            color: buttonColor!,
            borderRadius: BorderRadius.circular(radius ?? 8.r),
            border: border ?? Border.all(color: Colors.transparent),
          ),
          child: Center(
            child: ProjectText(
              text: text!,
              textColor: textColor!,
              fontSize: 16.sp,
            ),
          ),
        ),
        Positioned(
          child: Image.asset(
            ImageAssetsPath.lockClosedIcon,
            height: 35.sp,
            width: 35.sp,
          ),
        ),
      ],
    );
  }
}

//************************************************************************************
//////////        ICON BUTTON WIDGET
//************************************************************************************
// ignore: must_be_immutable
class IconButtonWidget extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final String? text;
  var border;
  var icon;

  IconButtonWidget({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.radius,
    this.border,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 48.sp,
      width: size.width,
      decoration: BoxDecoration(
        color: buttonColor!,
        borderRadius: BorderRadius.circular(radius ?? 8.r),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.scale(
            scale: 0.45.sp,
            child: Image.asset(icon!),
          ),
          ProjectText(
            text: text!,
            textColor: textColor!,
            fontSize: 16.sp,
          ),
        ],
      ),
    );
  }
}

//************************************************************************************
//////////        SMALL ICON BUTTON WIDGET
//************************************************************************************
class SmallIconButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final double? height;
  final double? width;
  final double? scale;
  final String? text;
  var border;
  var icon;

  SmallIconButton({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.height,
    this.radius,
    this.width,
    this.scale,
    this.border,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 48.sp,
      width: width ?? 133.sp,
      decoration: BoxDecoration(
        color: buttonColor!,
        borderRadius: BorderRadius.circular(radius ?? 8.r),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProjectText(
            text: text!,
            textColor: textColor!,
            fontSize: 14.sp,
          ),
          SizedBox(
            width: 10.sp,
          ),
          Transform.scale(
            scale: scale ?? 1.2.sp,
            child: Icon(
              icon!,
              color: const Color(0xFF140067),
            ),
          ),
        ],
      ),
    );
  }
}

//************************************************************************************
//////////        SMALL BUTTON WIDGET
//************************************************************************************
class SmallButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final double? width;
  final String? text;
  var border;

  SmallButton({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.width,
    this.radius,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.sp,
      width: width ?? 100.sp,
      decoration: BoxDecoration(
        color: buttonColor!,
        borderRadius: BorderRadius.circular(radius ?? 8.r),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: Center(
        child: ProjectText(
          text: text!,
          textColor: textColor!,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}

//************************************************************************************
//////////        BANK ICON BUTTON WIDGET DOUBLE
//************************************************************************************
class BankButtonDouble extends StatelessWidget {
  final Color? buttonColor;
  final String? secondText;
  final Color? textColor;
  final double? radius;
  final String? text;
  var border;
  var icon;

  BankButtonDouble({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.secondText,
    this.radius,
    this.border,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 58.sp,
      width: size.width,
      decoration: BoxDecoration(
        color: buttonColor!,
        borderRadius: BorderRadius.circular(radius ?? 8.r),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon!,
              height: 20.sp,
            ),
            SizedBox(
              width: 40.sp,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProjectText(
                  text: text!,
                  textColor: textColor!,
                  fontSize: 16.sp,
                ),
                ProjectText(
                  text: secondText ?? "",
                  textColor: textColor!,
                  fontSize: 16.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//************************************************************************************
//////////        BANK ICON BUTTON WIDGET SINGLE
//************************************************************************************
class BankButtonSingle extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final double? radius;
  final String? text;
  var border;
  var icon;

  BankButtonSingle({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.radius,
    this.border,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 48.sp,
      width: size.width,
      decoration: BoxDecoration(
        color: buttonColor!,
        borderRadius: BorderRadius.circular(radius ?? 8.r),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon!,
              height: 20.sp,
            ),
            SizedBox(
              width: 40.sp,
            ),
            ProjectText(
              text: text!,
              textColor: textColor!,
              fontSize: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}

//************************************************************************************
//////////        BANK ICON BUTTON WIDGET DOUBLE ICON
//************************************************************************************
class BankButtonDoubleIcon extends StatelessWidget {
  final Color? buttonColor;
  final String? secondText;
  final String? thirdText;
  final Color? textColor;
  final double? radius;
  final String? text;
  var border;
  var firstIcon;
  var secondIcon;

  BankButtonDoubleIcon({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.secondText,
    this.thirdText,
    this.radius,
    this.border,
    this.firstIcon,
    this.secondIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 78.sp,
      width: size.width,
      decoration: BoxDecoration(
        color: buttonColor!,
        borderRadius: BorderRadius.circular(radius ?? 8.r),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              firstIcon!,
              height: 24.sp,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProjectText(
                  text: text!,
                  textColor: textColor!,
                  fontSize: 16.sp,
                ),
                ProjectText(
                  text: secondText ?? "",
                  textColor: textColor!,
                  fontSize: 16.sp,
                ),
                ProjectText(
                  text: thirdText ?? "",
                  textColor: textColor!,
                  fontSize: 16.sp,
                ),
              ],
            ),
            Icon(
              secondIcon,
              size: 24.sp,
              color: blackText,
            ),
          ],
        ),
      ),
    );
  }
}

//************************************************************************************
//////////        SMALL ICON BUTTON WIDGET
//************************************************************************************
class ResizeIconButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final Color? iconColor;
  final double? radius;
  final double? width;
  final String? text;
  var border;
  var icon;

  ResizeIconButton({
    Key? key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    this.iconColor,
    this.radius,
    this.width,
    this.border,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 48.sp,
      width: width ?? 133.sp,
      decoration: BoxDecoration(
        color: buttonColor!,
        borderRadius: BorderRadius.circular(radius ?? 8.r),
        border: border ?? Border.all(color: Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProjectText(
            text: text!,
            textColor: textColor!,
            fontSize: 16.sp,
          ),
          SizedBox(
            width: 10.sp,
          ),
          Transform.scale(
            scale: 1.2.sp,
            child: Image.asset(
              icon!,
              height: 24.sp,
              width: 24.sp,
              color: iconColor ?? const Color(0xFF140067),
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////
//////////  Very little Icon widget
//////////////////////////////////////////////////////////////////////////

class LittleIconButton extends StatelessWidget {
  dynamic icon;
  final Color? containerColor;

  LittleIconButton({
    required this.icon,
    this.containerColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.sp,
      width: 48.sp,
      decoration: BoxDecoration(
        color: containerColor ?? lightPink,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: icon,
    );
  }
}
