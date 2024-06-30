import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/constants/asset_path.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/constants/error_strings.dart';
import 'package:payment_app/constants/nav_constants.dart';
import 'package:payment_app/constants/text_constants.dart';
import 'package:payment_app/constants/widgets/app_loading.dart';
import 'package:payment_app/constants/widgets/app_snackbar.dart';
import 'package:payment_app/constants/widgets/button_widget.dart';
import 'package:payment_app/constants/widgets/text_field_widget.dart';
import 'package:payment_app/screens/onboarding/signin.dart';
import 'package:payment_app/models/authentication/items/createpin_item.dart';
import 'package:payment_app/providers/state_notifier_provider/auth_provider.dart';
import 'package:payment_app/state/authentication/auth_state.dart';

class SetPin extends ConsumerStatefulWidget {
  const SetPin({super.key});

  @override
  ConsumerState<SetPin> createState() => _SetPinState();
}

class _SetPinState extends ConsumerState<SetPin> {
  TextEditingController loginPinController = TextEditingController();
  TextEditingController transPinController = TextEditingController();
  bool isLoginPinFilled = false;
  bool isTransPinFilled = false;

  void createPin() {
    if (!isLoginPinFilled || !isTransPinFilled) {
      AppSnackbar errorToast = AppSnackbar(context, isError: true);
      errorToast.showToast(text: "Both PIN fields must be filled.");
      return;
    }

    ref.read(createPinNotifierProvider.notifier).createPin(
          data: CreatePinItem(
            pinLogin: loginPinController.text.trim(),
            pinTrans: transPinController.text.trim(),
          ),
          context: context,
        );
    log("Seen Area");
  }

  void updateLoginPinFilled(bool filled) {
    setState(() {
      isLoginPinFilled = filled;
    });
  }

  void updateTransPinFilled(bool filled) {
    setState(() {
      isTransPinFilled = filled;
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createPinNotifierProvider);
    log(state.runtimeType.toString());
    if (state is CreatePinSuccessState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: "Pin creation Successful");
        ref.read(createPinNotifierProvider.notifier).resetState();
        nextScreen(context, SignIn());
      });
    } else if (state is CreatePinFailureState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(createPinNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(
          text: state.failure.message,
        );
      });
    }
    return Scaffold(
      backgroundColor: whiteBackground,
      body: Container(
        padding: EdgeInsets.only(top: 40.sp, left: 20.sp, right: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    color: purpleButton,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.sp),
              child: Image(
                image: AssetImage(ImageAssetsPath.createPinImage),
                height: 94.sp,
                width: 92.sp,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.sp),
              child: ProjectText(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                text: "Create your PIN",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.sp),
              child: ProjectText(
                fontSize: 14.sp,
                text:
                    "Create a secure PIN for your account to protect your account",
                fontWeight: FontWeight.w300,
              ),
            ),
            Spacer(),
            if (!isLoginPinFilled)
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: LoginPinWidget(
                            controller: loginPinController,
                            onPinFilled: updateLoginPinFilled,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: ButtonWidget(
                  buttonColor: purpleButton,
                  textColor: whiteText,
                  text: "Create Login PIN",
                ),
              ),
            if (isLoginPinFilled && !isTransPinFilled)
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: TransPinWidget(
                            controller: transPinController,
                            onPinFilled: updateTransPinFilled,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: ButtonWidget(
                  buttonColor: purpleButton,
                  textColor: whiteText,
                  text: "Create Transaction PIN",
                ),
              ),
            if (isLoginPinFilled && isTransPinFilled)
              if (state is CreatePinLoadingState) ...[
                const AppLoadingButton(
                  text: "Creating PIN",
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
                    onTap: () => createPin(),
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: ButtonWidget(
                        buttonColor: purpleButton,
                        text: "Create Pin",
                        textColor: whiteText,
                      ),
                    ),
                  ),
                ),
              ],
            SizedBox(
              height: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPinWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(bool) onPinFilled;

  const LoginPinWidget(
      {Key? key, required this.controller, required this.onPinFilled})
      : super(key: key);

  @override
  _LoginPinWidgetState createState() => _LoginPinWidgetState();
}

class _LoginPinWidgetState extends State<LoginPinWidget> {
  String pin = '';

  void onKeyPress(String key) {
    setState(() {
      if (key == 'DEL') {
        if (pin.isNotEmpty) {
          pin = pin.substring(0, pin.length - 1);
          widget.controller.text = pin;
        }
      } else if (pin.length < 5) {
        pin += key;
        widget.controller.text = pin;
      }
      widget.onPinFilled(pin.isNotEmpty); // Notify parent when PIN is not empty
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.sp),
            child: ProjectText(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              text: "Create your PIN",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: ProjectText(
              fontSize: 14.sp,
              text: "Create a pin for your Login",
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          TextFieldBox(
            width: 90.sp,
            fillColor: transBackground,
            hintText: pin.padRight(5, '*'),
            height: 40.sp,
            obscureText: true,
            hintStyle: TextStyle(fontSize: 13.sp),
            isEnabled: false,
            controller: widget.controller,
          ),
          SizedBox(height: 20.sp),
          CustomKeyboard(onKeyPress: onKeyPress),
          SizedBox(height: 20.sp),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ButtonWidget(
              buttonColor: purpleButton,
              textColor: whiteText,
              text: "Continue",
            ),
          ),
        ],
      ),
    );
  }
}

class TransPinWidget extends StatefulWidget {
  final TextEditingController controller;
  final Function(bool) onPinFilled;

  const TransPinWidget(
      {Key? key, required this.controller, required this.onPinFilled})
      : super(key: key);

  @override
  _TransPinWidgetState createState() => _TransPinWidgetState();
}

class _TransPinWidgetState extends State<TransPinWidget> {
  String pin = '';

  void onKeyPress(String key) {
    setState(() {
      if (key == 'DEL') {
        if (pin.isNotEmpty) {
          pin = pin.substring(0, pin.length - 1);
          widget.controller.text = pin;
        }
      } else if (pin.length < 5) {
        pin += key;
        widget.controller.text = pin;
      }
      widget.onPinFilled(pin.isNotEmpty); // Notify parent when PIN is not empty
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.sp),
            child: ProjectText(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              text: "Create your Transaction PIN",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: ProjectText(
              fontSize: 14.sp,
              text: "Create a pin for your Transactions",
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(height: 20.sp),
          TextFieldBox(
            width: 90.sp,
            fillColor: transBackground,
            hintText: pin.padRight(5, '*'),
            height: 40.sp,
            obscureText: true,
            hintStyle: TextStyle(fontSize: 13.sp),
            isEnabled: false,
            controller: widget.controller,
          ),
          SizedBox(height: 20.sp),
          CustomKeyboard(onKeyPress: onKeyPress),
          SizedBox(height: 20.sp),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ButtonWidget(
              buttonColor: purpleButton,
              textColor: whiteText,
              text: "Continue",
            ),
          ),
        ],
      ),
    );
  }
}

class CustomKeyboard extends StatelessWidget {
  final Function(String) onKeyPress;

  CustomKeyboard({required this.onKeyPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 2,
        ),
        itemBuilder: (context, index) {
          String key;
          if (index < 9) {
            key = '${index + 1}';
          } else if (index == 9) {
            key = '';
          } else if (index == 10) {
            key = '0';
          } else {
            key = 'DEL';
          }
          return GestureDetector(
            onTap: key.isNotEmpty ? () => onKeyPress(key) : null,
            child: Container(
              margin: EdgeInsets.all(4.sp),
              alignment: Alignment.center,
              child: Text(
                key,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: key == 'DEL' ? Colors.red : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
