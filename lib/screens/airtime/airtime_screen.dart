import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/constants/asset_path.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/constants/nav_constants.dart';
import 'package:payment_app/constants/text_constants.dart';
import 'package:payment_app/constants/widgets/button_widget.dart';
import 'package:payment_app/constants/widgets/recent_topups_widget.dart';
import 'package:payment_app/constants/widgets/text_field_widget.dart';
import 'package:payment_app/screens/airtime/preview.dart';

class AirtimeScreen extends StatefulWidget {
  const AirtimeScreen({super.key});

  @override
  State<AirtimeScreen> createState() => _AirtimeScreenState();
}

class _AirtimeScreenState extends State<AirtimeScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
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
                    text: "Top Up",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 15.sp),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: whiteBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.sp,
                              vertical: 10.sp,
                            ),
                            child: Column(
                              children: [
                                ProjectText(
                                  fontSize: 21.sp,
                                  text: "Airtime Recharge",
                                  fontWeight: FontWeight.w700,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 40.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ProjectText(
                                        fontSize: 13.sp,
                                        text: "Select a Network",
                                        fontWeight: FontWeight.w700,
                                        textColor: grayBorder,
                                      ),
                                      SizedBox(height: 4.sp),
                                      DropdownBox(
                                        hintText: 'Select Mobile Operator',
                                        value: _selectedValue,
                                        items: [
                                          DropdownMenuItem(
                                            value: 'Option 1',
                                            child: Text('Option 1'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Option 2',
                                            child: Text('Option 2'),
                                          ),
                                          DropdownMenuItem(
                                            value: 'Option 3',
                                            child: Text('Option 3'),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedValue = value;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please select an option';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.sp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ProjectText(
                                        fontSize: 13.sp,
                                        text: "Phone Number",
                                        fontWeight: FontWeight.w700,
                                        textColor: grayBorder,
                                      ),
                                      SizedBox(height: 4.sp),
                                      TextFieldBox(
                                        hintText: "Enter phone number",
                                        height: 50.sp,
                                        obscureText: true,
                                        hintStyle: TextStyle(
                                            color: grayBorder, fontSize: 13.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 40.sp,
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      nextScreen(context, const Preview()),
                                  child: ButtonWidget(
                                    buttonColor: purpleButton,
                                    text: "Buy Airtime",
                                    textColor: whiteText,
                                  ),
                                ),
                                SizedBox(
                                  height: 40.sp,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13.sp),
                    border: Border.all(color: Color(0xffE5E5E5), width: 1.sp),
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
                            AssetImage(ImageAssetsPath.airtimeIconImage),
                            color: whiteText,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp),
                        child: ProjectText(
                          fontSize: 15.sp,
                          text: "Airtime Recharge",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.sp),
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: 15.sp, horizontal: 10.sp),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.sp),
                  border: Border.all(color: Color(0xffE5E5E5), width: 1.sp),
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
                padding: EdgeInsets.only(top: 25.sp),
                child: ProjectText(
                  fontSize: 21.sp,
                  text: "Recent Top Ups",
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 15.sp,
              ),
              Column(
                children: [
                  RecentTopupsWidget(
                    transaction: "MTN",
                    details: "MTN-2346789087645",
                    amount: "20,00",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
