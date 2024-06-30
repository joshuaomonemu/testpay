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
import 'package:payment_app/screens/onboarding/verify_email.dart';
import 'package:payment_app/state/authentication/auth_state.dart';
import 'package:payment_app/models/authentication/items/register_item.dart';
import 'package:payment_app/providers/state_notifier_provider/auth_provider.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  int onboardingScreenIndex = 0; // Index of the current screen
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  bool? checked = false;

  void register() {
    if (emailController.text.isEmpty &&
        fnameController.text.isEmpty &&
        lnameController.text.isEmpty) {
      return;
    }

    ref.read(registerNotifierProvider.notifier).register(
        data: RegisterItem(
          email: emailController.text.trim(),
          fName: fnameController.text.trim(),
          lName: lnameController.text.trim(),
        ),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(registerNotifierProvider);
    log(state.runtimeType.toString());
    if (state is RegisterSuccessState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: "Registration Successful");
        ref.read(registerNotifierProvider.notifier).resetState();
        nextScreen(context, VerifyEmail());
      });
    } else if (state is RegisterFailureState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(registerNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(
          text: state.failure.message,
        );
      });
    }
    // Obtain the height of the keyboard using MediaQuery
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    // Calculate the available screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.sp, left: 10.sp, right: 10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => onboardingScreenIndex == 0
                        ? Navigator.pop(context)
                        : setState(() {
                            onboardingScreenIndex =
                                (onboardingScreenIndex - 1) % 3;
                          }),
                    child: Icon(
                      Icons.arrow_back,
                      color: purpleButton,
                    ),
                  ),
                  Row(
                    children: List.generate(2, (index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.0),
                        child: Container(
                          width: 20.sp,
                          height: 6.sp,
                          decoration: BoxDecoration(
                            color: onboardingScreenIndex >= index
                                ? purpleButton
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(4.sp),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(width: 24.sp), // To balance the row
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: onboardingScreenIndex,
                children: [
                  buildScreen1(context, screenHeight, bottomInset),
                  buildScreen2(context, screenHeight, bottomInset),
                ],
              ),
            ),
            if (state is RegisterLoadingState) ...[
              const AppLoadingButton(
                text: "Registering",
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
                  onTap: onboardingScreenIndex == 1
                      ? () => register()
                      : () => setState(() {
                            onboardingScreenIndex =
                                (onboardingScreenIndex + 1) % 2;
                          }),
                  child: Padding(
                    padding: EdgeInsets.all(20.sp),
                    child: ButtonWidget(
                      buttonColor: purpleButton,
                      text: "Continue",
                      textColor: whiteText,
                    ),
                  ),
                ),
              )
            ],
          ],
        ),
      ),
    );
  }

  Widget buildScreen1(
      BuildContext context, double screenHeight, double bottomInset) {
    return Container(
      height: screenHeight - bottomInset,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.sp),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProjectText(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    text: "What’s your email?",
                    textColor: grayBorder,
                  ),
                  SizedBox(height: 10.sp),
                  ProjectText(
                    fontSize: 14.sp,
                    text:
                        "You will receive a verification code so make sure it is active",
                    textColor: grayBorder,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(height: 25.sp),
                  TextFieldBox(
                    hintText: "johndoe@gmail.com",
                    height: 55.sp,
                    hintStyle: TextStyle(color: grayBorder, fontSize: 16.sp),
                    controller: emailController,
                    validator: (value) {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildScreen2(
      BuildContext context, double screenHeight, double bottomInset) {
    return Container(
      height: screenHeight - bottomInset,
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.sp),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProjectText(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    text: "What’s your name? ",
                    textColor: grayBorder,
                  ),
                  SizedBox(height: 10.sp),
                  ProjectText(
                    fontSize: 14.sp,
                    text: "Please type in your full name",
                    textColor: grayBorder,
                    fontWeight: FontWeight.w300,
                  ),
                  SizedBox(height: 25.sp),
                  ProjectText(
                    fontSize: 13.sp,
                    text: "First Name",
                    fontWeight: FontWeight.w700,
                    textColor: grayBorder,
                  ),
                  SizedBox(height: 4.sp),
                  TextFieldBox(
                    hintText: "First name",
                    height: 55.sp,
                    hintStyle: TextStyle(color: grayBorder, fontSize: 16.sp),
                    controller: fnameController,
                    validator: (value) {},
                  ),
                  SizedBox(height: 25.sp),
                  ProjectText(
                    fontSize: 13.sp,
                    text: "Last Name",
                    fontWeight: FontWeight.w700,
                    textColor: grayBorder,
                  ),
                  SizedBox(height: 4.sp),
                  TextFieldBox(
                    hintText: "Last name",
                    height: 55.sp,
                    hintStyle: TextStyle(color: grayBorder, fontSize: 16.sp),
                    controller: lnameController,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
