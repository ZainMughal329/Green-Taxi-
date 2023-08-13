import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


Widget greenIntroWidgetWithOutLogo(){

  return Container(
    width: Get.width,
    decoration: BoxDecoration(

      image: DecorationImage(image: AssetImage('assets/mask.png'),
      fit: BoxFit.fill),
    ),
    height: Get.height*0.3,
    child: Container(
      height: Get.height*0.1,
      width: Get.width,
      margin: EdgeInsets.only(bottom: Get.height*0.05),
      child: Center(
        child: Text(
          "Profile settings",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w500 , color: Colors.white),
        )
      ),
    ),
  );

}