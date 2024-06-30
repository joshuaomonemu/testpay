import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/constants/asset_path.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/constants/nav_constants.dart';
import 'package:payment_app/constants/text_constants.dart';
import 'package:payment_app/constants/widgets/app_loading.dart';
import 'package:payment_app/constants/widgets/app_snackbar.dart';
import 'package:payment_app/constants/widgets/button_widget.dart';
import 'package:payment_app/constants/widgets/text_field_widget.dart';
import 'package:payment_app/constants/widgets/transaction_history_widget.dart';
import 'package:payment_app/models/authentication/items/user_details.dart';
import 'package:payment_app/models/paystack/items/paystack_initialize_item.dart';
import 'package:payment_app/providers/state_notifier_provider/auth_provider.dart';
import 'package:payment_app/providers/state_notifier_provider/paystack_provider.dart';
import 'package:payment_app/screens/airtime/preview.dart';
import 'package:payment_app/screens/home/main_page.dart';
import 'package:payment_app/screens/repayments/repayments_screen.dart';
import 'package:payment_app/state/authentication/auth_state.dart';
import 'package:payment_app/state/paystack/paystack_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController amountController = TextEditingController();
  UserDetails? user;

  void initialize() {
    if (amountController.text.isEmpty) {
      return;
    }

    ref.read(payStackNotifierProvider.notifier).initializePaystack(
        data: PaystackIntializeItem(amount: amountController.text.trim()),
        context: context);
    log("Seen Area" as num);
  }

  @override
  Widget build(BuildContext context) {
    final userDetailState = ref.watch(getUserDetailsNotifierProvider);

    if (userDetailState is GetUserDetailsSuccessState) {
      user = userDetailState.success;
    }

    final paystackState = ref.watch(payStackNotifierProvider);
    log(paystackState.runtimeType.toString() as num);
    if (paystackState is PaystackSuccessState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppSnackbar errorToast = AppSnackbar(context);
        errorToast.showToast(text: "Transaction Initialized");
        ref.read(loginNotifierProvider.notifier).resetState();
        nextScreen(context, RepaymentsScreen());
      });
    } else if (paystackState is PaystackFailureState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(loginNotifierProvider.notifier).resetState();
        AppSnackbar errorToast = AppSnackbar(context, isError: true);
        errorToast.showToast(
          text: paystackState.failure.message,
        );
      });
    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.sp, left: 30.sp, right: 30.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProjectText(
                          text: "Welcome,",
                          fontSize: 16.sp,
                          textColor: purpleButton,
                          fontWeight: FontWeight.w400,
                        ),
                        if (user != null)
                          ProjectText(
                            text: "${user!.lname}.",
                            fontSize: 22.sp,
                            textColor: purpleButton,
                            fontWeight: FontWeight.w700,
                          )
                      ],
                    ),
                    Container(
                      width: 43.sp,
                      height: 43.sp,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: purpleButton, width: 2.sp),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ImageAssetsPath.spalshOne),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.sp,
              ),
              Container(
                height: 300.sp,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffCB7169),
                  borderRadius: BorderRadius.circular(13.sp),
                  border: Border.all(color: purpleButton, width: 1.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0.sp, vertical: 20.sp),
                  child: Column(
                    children: [
                      ProjectText(
                        fontSize: 14.sp,
                        text: "Total Balance",
                        fontWeight: FontWeight.w500,
                        textColor: whiteText,
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      if (user != null)
                        ProjectText(
                          fontSize: 36.sp,
                          text: "N${user!.wallet}",
                          fontWeight: FontWeight.w700,
                          textColor: whiteText,
                        ),
                      SizedBox(
                        height: 15.sp,
                      ),
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
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
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
                                          text: "Fund Wallet",
                                          fontWeight: FontWeight.w700,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20.sp),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ProjectText(
                                                fontSize: 13.sp,
                                                text: "Amount to Fund",
                                                fontWeight: FontWeight.w700,
                                                textColor: grayBorder,
                                              ),
                                              SizedBox(height: 4.sp),
                                              TextFieldBox(
                                                hintText: "Enter amount",
                                                height: 50.sp,
                                                controller: amountController,
                                                obscureText: true,
                                                hintStyle: TextStyle(
                                                    color: grayBorder,
                                                    fontSize: 13.sp),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40.sp,
                                        ),
                                        if (paystackState
                                            is PaystackLoadingState) ...[
                                          Padding(
                                            padding:
                                                EdgeInsets.only(top: 50.sp),
                                            child: const AppLoadingButton(
                                              text: "Processing...",
                                            ),
                                          ),
                                        ] else ...[
                                          GestureDetector(
                                            onTap: () => {initialize()},
                                            child: ButtonWidget(
                                              buttonColor: purpleButton,
                                              text: "Continue",
                                              textColor: whiteText,
                                            ),
                                          ),
                                        ],
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(color: whiteText, width: 1.sp),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.sp, vertical: 10.sp),
                            child: ProjectText(
                              fontSize: 12.sp,
                              text: "Fund Wallet",
                              fontWeight: FontWeight.w400,
                              textColor: whiteText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Divider(
                        color: purpleButton,
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: purpleButton,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.sp),
                                  child: ImageIcon(
                                    AssetImage(ImageAssetsPath.navHome),
                                    color: whiteText,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              ProjectText(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                text: "Home",
                                textColor: whiteText,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: purpleButton,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.sp),
                                  child: ImageIcon(
                                    AssetImage(ImageAssetsPath.navRapayments),
                                    color: whiteText,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              ProjectText(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                text: "Repayments",
                                textColor: whiteText,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: purpleButton,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.sp),
                                  child: ImageIcon(
                                    AssetImage(ImageAssetsPath.navBills),
                                    color: whiteText,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              ProjectText(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                text: "Bills",
                                textColor: whiteText,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: purpleButton,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.sp),
                                  child: ImageIcon(
                                    AssetImage(ImageAssetsPath.navAirtime),
                                    color: whiteText,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              ProjectText(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                text: "Airtime",
                                textColor: whiteText,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
              ),
              ProjectText(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  text: "Recent Transactions"),
              SizedBox(
                height: 30.sp,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Column(
                  children: [
                    TransactionHistoryWidget(
                      transaction: "Airtime",
                      date: "01/09/2021",
                      amount: "20,000.34",
                      amountDetails: "+234 590 6782",
                    ),
                    TransactionHistoryWidget(
                      transaction: "EKEDC bill",
                      date: "01/09/2021",
                      amount: "20,000.34",
                      amountDetails: "EKEDC electricity bill",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
