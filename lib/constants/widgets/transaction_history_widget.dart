import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/constants/asset_path.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/constants/text_constants.dart';

class TransactionHistoryWidget extends StatefulWidget {
  final String transaction;
  final String date;
  final String amount;
  final String amountDetails;

  const TransactionHistoryWidget({
    super.key,
    required this.transaction,
    required this.date,
    required this.amount,
    required this.amountDetails,
  });

  @override
  State<TransactionHistoryWidget> createState() =>
      _TransactionHistoryWidgetState();
}

class _TransactionHistoryWidgetState extends State<TransactionHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageIcon(
                size: 27.sp,
                AssetImage(ImageAssetsPath.checkCircled),
                color: purpleButton,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectText(
                      fontSize: 15.sp,
                      text: widget.transaction,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 3.sp,
                    ),
                    ProjectText(fontSize: 11.sp, text: widget.date)
                  ],
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ProjectText(
                fontSize: 15.sp,
                text: "N${widget.amount}",
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 3.sp,
              ),
              ProjectText(fontSize: 11.sp, text: widget.amountDetails)
            ],
          ),
        ],
      ),
    );
  }
}
