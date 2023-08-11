import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_taxi/utilities/utils/app_colors.dart';
import 'package:green_taxi/utilities/widgets/green_intro_widget.dart';

import '../../utilities/widgets/otp_verification_widget.dart';

class OTPverificationScreen extends StatefulWidget {
  const OTPverificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPverificationScreen> createState() => _OTPverificationScreenState();
}

class _OTPverificationScreenState extends State<OTPverificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Stack(children: [GreenIntroWidget(),
          Positioned(
              top: 60,
              left: 30,
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white
            ),
                  child: Icon(Icons.arrow_back,color: AppColors.greenColor,size: 20,),
          ),
              ))

          ]),
          SizedBox(height: 50,),
          OTPVerificationWidget(),
        ],
      ) ,
    );
  }
}
