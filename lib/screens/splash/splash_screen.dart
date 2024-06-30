import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_app/constants/asset_path.dart';
import 'package:payment_app/constants/nav_constants.dart';
import 'package:payment_app/constants/text_constants.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/constants/widgets/button_widget.dart';
import 'package:payment_app/screens/onboarding/signin.dart';
import 'package:payment_app/screens/onboarding/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int activeIndex = 0;
  Timer? _timer; // Add a timer

  final List<String> introImages = [
    ImageAssetsPath.spalshOne,
    ImageAssetsPath.spalshTwo,
    ImageAssetsPath.splashThree,
  ];

  final List<String> introTitles = [
    "Get the best Buy Now, Pay Later payment options",
    "Buy airtime and data just at the tip of your fingers for yourself, family and friends",
    "Pay your favourite vendors easily and seamlessly",
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 15), (timer) {
      setState(() {
        activeIndex = (activeIndex + 1) % introImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void goToSkip() {
    setState(() {
      activeIndex = 3;
    });
    _timer?.cancel(); // Stop the timer when skipping
  }

  void goBack() {
    if (activeIndex == 0) {
      return; // If already at the first index, do nothing.
    }

    setState(() {
      activeIndex = (activeIndex - 1) % introImages.length;
    });
  }

  void goToNextIntro() {
    setState(() {
      activeIndex = (activeIndex + 1) % introImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.8;
    Size size = MediaQuery.of(context).size;
    double innerContainerWidth = (activeIndex + 1) * 14.4;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.center,
              fit: BoxFit.fill,
              image: AssetImage(
                introImages[activeIndex],
              ),
            ),
          ),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 450),
                  child: Column(children: [
                    ProjectText(
                      text: introTitles[activeIndex],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () => nextScreen(context, const SignUp()),
                      child: ButtonWidget(
                        text: "Open an account now",
                        textColor: whiteText,
                        buttonColor: purpleButton,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () => nextScreen(context, const SignIn()),
                      child: ButtonWidget(
                        text: "Sign In",
                        textColor: whiteText,
                        buttonColor: transBackground,
                        border: Border.all(color: purpleButton, width: 1),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
