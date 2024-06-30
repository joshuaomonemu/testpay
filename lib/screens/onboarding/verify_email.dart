import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/constants/error_strings.dart';
import 'package:payment_app/constants/nav_constants.dart';
import 'package:payment_app/constants/text_constants.dart';
import 'package:payment_app/constants/widgets/app_loading.dart';
import 'package:payment_app/constants/widgets/app_snackbar.dart';
import 'package:payment_app/constants/widgets/button_widget.dart';
import 'package:payment_app/constants/widgets/text_field_widget.dart';
import 'package:payment_app/models/authentication/items/verify_email.dart';
import 'package:payment_app/screens/onboarding/set_pin.dart';
import 'package:payment_app/state/authentication/auth_state.dart';
import 'package:payment_app/providers/state_notifier_provider/auth_provider.dart';

class VerifyEmail extends ConsumerStatefulWidget {
  const VerifyEmail({super.key});

  @override
  ConsumerState<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends ConsumerState<VerifyEmail> {
  TextEditingController tokenController = TextEditingController();

  void verifyEmail() {
    if (tokenController.text.isEmpty) {
      return;
    }
    int token = int.parse(tokenController.text.trim());
    ref.read(verifyEmailNotifierProvider.notifier).verifyEmail(
        data: VerifyEmailItem(
          token: token,
        ),
        context: context);
    log("Seen Area");
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(verifyEmailNotifierProvider);
    log(state.runtimeType.toString());
    if (state is VerifyEmailSuccessState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: "Email verification Successful");
        ref.read(verifyEmailNotifierProvider.notifier).resetState();
        nextScreen(context, SetPin());
      });
    } else if (state is VerifyEmailFailureState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(verifyEmailNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(
          text: state.failure.message,
        );
      });
    }
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    // Calculate the available screen height
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenHeight - bottomInset,
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
        color: whiteBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back,
                      color: purpleButton,
                    ),
                  ),
                  SizedBox(width: 24.sp), // To balance the row
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 30.sp),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProjectText(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        text: "Confirm email address",
                      ),
                      SizedBox(height: 10.sp),
                      ProjectText(
                        fontSize: 14.sp,
                        text:
                            "Please enter the code sent to the email ending in @gmail.com",
                        fontWeight: FontWeight.w300,
                      ),
                      SizedBox(height: 25.sp),
                      ProjectText(
                        fontSize: 10.sp,
                        text: "Enter OTP",
                        fontWeight: FontWeight.w700,
                        textColor: grayBorder,
                      ),
                      SizedBox(height: 2.sp),
                      TextFieldBox(
                        hintText: "",
                        height: 55.sp,
                        controller: tokenController,
                        validator: (value) {},
                        hintStyle:
                            TextStyle(color: grayBorder, fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (state is VerifyEmailLoadingState) ...[
              const AppLoadingButton(
                text: "Verifying",
              ),
            ] else ...[
              GestureDetector(
                onTap: () {
                  AppSnackbar errorToast =
                      AppSnackbar(context, isError: true, height: 50);
                  errorToast.showToast(
                    text: ErrorStrings.tandcerror,
                  );
                },
                child: GestureDetector(
                  onTap: () => verifyEmail(),
                  child: Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: ButtonWidget(
                      buttonColor: purpleButton,
                      text: "Continue",
                      textColor: whiteText,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
