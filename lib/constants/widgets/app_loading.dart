import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/constants/text_constants.dart';

class AppLoadingButton extends StatelessWidget {
  final String? text;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? color;
  final Color? textColor;
  const AppLoadingButton({
    Key? key,
    this.height,
    this.width,
    this.text,
    this.borderRadius,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? 330.sp,
        height: height ?? 48.h,
        child: ElevatedButton(
          onPressed: null,
          style: ButtonStyle(
            //Elevation based on states
            elevation: MaterialStateProperty.resolveWith<double>((states) {
              if (states.contains(MaterialState.pressed)) {
                return 0;
              }
              return 0;
            }),
            //Border
            shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
              (states) {
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 8.0.r),
                );
              },
            ),
            backgroundColor: color != null
                ? MaterialStateProperty.resolveWith<Color>((states) => color!)
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              ProjectText(
                text: text ?? "Verifying",
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textColor: whiteText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 20.h,
      width: width ?? 40.w,
      child: const LoadingIndicator(
        indicatorType: Indicator.lineScalePulseOut,
        colors: [
          Colors.green,
        ],
      ),
    );
  }
}
