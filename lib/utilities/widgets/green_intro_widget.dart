import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget GreenIntroWidget() {
  return Container(
    height: Get.height.h * 0.55,
    width: Get.width,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/mask.png'), fit: BoxFit.cover),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/leaf icon.svg'),
        SizedBox(height: 20.h,),
        SvgPicture.asset('assets/greenTaxi.svg'),
      ],
    ),
  );
}
