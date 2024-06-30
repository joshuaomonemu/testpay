import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/constants/asset_path.dart';
import 'package:payment_app/constants/color_constants.dart';
import 'package:payment_app/constants/text_constants.dart';

class RecentTopupsWidget extends StatefulWidget {
  final String transaction;
  final String details;
  final String amount;

  const RecentTopupsWidget({
    super.key,
    required this.transaction,
    required this.details,
    required this.amount,
  });

  @override
  State<RecentTopupsWidget> createState() => _RecentTopupsWidgetState();
}

class _RecentTopupsWidgetState extends State<RecentTopupsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.sp),
        border: Border.all(color: Color(0xffE5E5E5), width: 1.sp),
      ),
      padding: EdgeInsets.only(bottom: 15.sp),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Color(0xffE2AFAB),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.sp, vertical: 8.sp),
                    child: ImageIcon(
                      AssetImage(ImageAssetsPath.navBills),
                      color: whiteText,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProjectText(
                        fontSize: 15.sp,
                        text: widget.transaction,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 3.sp,
                      ),
                      ProjectText(fontSize: 11.sp, text: widget.details)
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
                  height: 10.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
