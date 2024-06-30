import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/constants/asset_path.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/constants/text_constants.dart';
import 'package:payment_app/constants/widgets/button_widget.dart';
import 'package:payment_app/constants/widgets/text_field_widget.dart';

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  TextEditingController transPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.sp),
                  child: ProjectText(
                    fontSize: 21.sp,
                    text: "Review Payment",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 40.sp),
              ProjectText(
                fontSize: 14.sp,
                text: "Please review the details below",
                fontWeight: FontWeight.w400,
              ),
              SizedBox(
                height: 10.sp,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.sp),
                  border: Border.all(color: Color(0xffE5E5E5), width: 1.sp),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.sp, horizontal: 10.sp),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13.sp),
                        border:
                            Border.all(color: Color(0xffE5E5E5), width: 1.sp),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: Color(0xffE2AFAB),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.sp, vertical: 8.sp),
                              child: ImageIcon(
                                AssetImage(ImageAssetsPath.dataIconImage),
                                color: whiteText,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.sp),
                            child: ProjectText(
                              fontSize: 15.sp,
                              text: "Buy Data",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProjectText(
                            fontSize: 12.sp,
                            text: "Payment Source",
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 3.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "2100111345",
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 25.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "Bill Type",
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 3.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "Electricity",
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 25.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "Bill Num",
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 3.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "11111111111",
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 25.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "Transaction Number",
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 3.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "EUE0111345",
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 25.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "Amount",
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 3.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "N20,000.00",
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 25.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "Biller",
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 3.sp,
                          ),
                          ProjectText(
                            fontSize: 12.sp,
                            text: "2100111345",
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60.sp,
              ),
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
                          child: SubPinWidget(
                            controller: transPinController,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: ButtonWidget(
                  buttonColor: purpleButton,
                  text: "Confirm",
                  textColor: whiteText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubPinWidget extends StatefulWidget {
  final TextEditingController controller;

  const SubPinWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _SubPinWidgetState createState() => _SubPinWidgetState();
}

class _SubPinWidgetState extends State<SubPinWidget> {
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
              text: "Enter Your Pin",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.sp),
            child: ProjectText(
              fontSize: 14.sp,
              text: "Kindly enter your transaction PIN to continue",
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
