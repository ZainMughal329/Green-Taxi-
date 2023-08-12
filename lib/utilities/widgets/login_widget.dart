import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_taxi/screens/login/otp_verification_screen.dart';
import 'package:green_taxi/utilities/routes/route_name.dart';
import 'package:green_taxi/utilities/utils/app_constants.dart';
import 'package:green_taxi/utilities/widgets/text_widget.dart';

Widget LoginWidget(CountryCode code, Function changeCountry,Function onSubmit) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(text: AppConstants.helloNiceToMeetYou),
        SizedBox(
          height: 5.h,
        ),
        TextWidget(
            text: AppConstants.getMovingWithGreenTaxi,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp),
        SizedBox(
          height: 40.h,
        ),
        Container(
          height: 55.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 3,
                blurRadius: 3,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: GestureDetector(
                    onTap: () => changeCountry(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Container(
                            child: code.flagImage(),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        TextWidget(
                          text: code.dialCode.toString(),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.black.withOpacity(0.4),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 45.h,
                width: 1.w,
                color: Colors.black.withOpacity(0.1),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: TextField(
                    onSubmitted: (String? input) => onSubmit(input),
                    // onTap: () {
                    //   Get.to(() => OTPverificationScreen(),);
                    // },
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.poppins(
                          fontWeight: FontWeight.normal, fontSize: 12),
                      border: InputBorder.none,
                      hintText: AppConstants.enterMobileNumber,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 12, color: Colors.black),
              children: [
                TextSpan(
                  text: AppConstants.byCreating + " ",
                ),
                TextSpan(
                  text: AppConstants.termsOfService + " ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "and ",
                ),
                TextSpan(
                  text: AppConstants.privacyPolicy + " ",
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
