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
import 'package:payment_app/models/authentication/items/log_in_item.dart';
import 'package:payment_app/screens/home/main_page.dart';
import 'package:payment_app/state/authentication/auth_state.dart';
import 'package:payment_app/providers/state_notifier_provider/auth_provider.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      return;
    }

    ref.read(loginNotifierProvider.notifier).login(
        data: LogInItem(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
        context: context);
    log("Seen Area");
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginNotifierProvider);
    log(state.runtimeType.toString());
    if (state is LoginSuccessState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: "Login Successful");
        ref.read(loginNotifierProvider.notifier).resetState();
        nextScreen(context, MainPage());
      });
    } else if (state is LoginFailureState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(loginNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(
          text: state.failure.message,
        );
      });
    }
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
          color: Theme.of(context).colorScheme.surface,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectText(
                      fontSize: 12.sp,
                      text: "Email",
                      textColor: grayBorder,
                    ),
                    SizedBox(height: 4.sp),
                    TextFieldBox(
                      hintText: "johndoe@gmail.com",
                      controller: emailController,
                      height: 50.sp,
                      hintStyle: TextStyle(color: grayBorder, fontSize: 13.sp),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectText(
                      fontSize: 12.sp,
                      text: "Pin",
                      textColor: grayBorder,
                    ),
                    SizedBox(height: 4.sp),
                    TextFieldBox(
                      hintText: "*****",
                      height: 50.sp,
                      controller: passwordController,
                      obscureText: true,
                      hintStyle: TextStyle(color: grayBorder, fontSize: 13.sp),
                    ),
                  ],
                ),
              ),
              if (state is LoginLoadingState) ...[
                Padding(
                  padding: EdgeInsets.only(top: 50.sp),
                  child: const AppLoadingButton(
                    text: "Logining...",
                  ),
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
                    onTap: () => login(),
                    child: Padding(
                      padding: EdgeInsets.all(50.sp),
                      child: ButtonWidget(
                        buttonColor: purpleButton,
                        text: "Login",
                        textColor: whiteText,
                      ),
                    ),
                  ),
                )
              ],
              Padding(
                padding: EdgeInsets.only(top: 20.sp),
                child: ProjectText(
                  fontSize: 14.sp,
                  text: "Forgot password?",
                  textColor: grayBorder,
                ),
              ),
            ],
          )),
    );
  }
}
