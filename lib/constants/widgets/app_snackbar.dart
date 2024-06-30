import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

///Uses the [Fluttertoast] package
///to build a custom Toast widget
///according to design specification.
class AppSnackbar {
  final BuildContext context;
  final bool isError;
  final int? seconds;
  final double height;

  final FToast _fToast = FToast();

  AppSnackbar(
    this.context, {
    this.isError = false,
    this.seconds,
    this.height = 60,
  }) {
    _fToast.init(context);
  }
  void showToast({required String text}) {
    final Size size = MediaQuery.of(context).size;
    final Widget toastWidget = Container(
      width: size.width,
      height: height.sp,
      padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 14.0),
      decoration: BoxDecoration(
        color: isError ? Colors.redAccent : const Color(0xFF34A853),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: size.width / 1.4,
            child: Text(
              text,
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: isError
                      ? const Color(0xFFFFFFFF)
                      : const Color(0xFFFFFFFF),
                  fontSize: 13.0),
            ),
          ),
          // InkWell(
          //   onTap: () => Navigator.of(context).pop,
          //   child: Image.asset(
          //     GateAssetsPaths.closeCircleIcon,
          //     height: 32.h,
          //     width: 32.w,
          //   ),
          // ),
        ],
      ),
    );

    _fToast.showToast(
      child: toastWidget,
      toastDuration: Duration(seconds: seconds ?? 4),
      gravity: ToastGravity.BOTTOM,
      positionedToastBuilder: (context, child) => Positioned(
        //top: 0.h,
        top: size.height * 0.039,
        // bottom: size.height * 0.014,
        //left: size.width * 0.0628,
        child: Center(child: child),
      ),
    );
  }
}

class ShowToast {
  static void errorToast(BuildContext context, String text) {
    AppSnackbar toast = AppSnackbar(context, isError: true);
    toast.showToast(text: text);
  }

  static void successToast(BuildContext context, String text) {
    AppSnackbar toast = AppSnackbar(context);
    toast.showToast(text: text);
  }
}
