import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_taxi/utilities/routes/route_name.dart';
import 'package:green_taxi/utilities/utils/app_constants.dart';
import 'package:green_taxi/utilities/widgets/pinput_widget.dart';
import 'package:green_taxi/utilities/widgets/text_widget.dart';
Widget OTPVerificationWidget() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(text: AppConstants.phoneVerification),
          SizedBox(
            height:  5.h,
          ),
          TextWidget(
              text: AppConstants.enterOtp,
              fontWeight: FontWeight.bold,
              fontSize: 22.sp),
          SizedBox(
            height: 20.h,
          ),
          
          Container(
            // height: 50.h,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.white,
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.05),
              //     spreadRadius: 3,
              //     blurRadius: 3
              //   )
              // ],
              borderRadius: BorderRadius.circular(8)
            ),
            child: RoundWithShadow(),
          ),
          SizedBox(
            height: 20.h,
          ),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: TextStyle(fontSize: 12, color: Colors.black),
              children: [
                TextSpan(
                  text: AppConstants.resendCode + " ",
                ),
                TextSpan(
                  text: "10 second",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
