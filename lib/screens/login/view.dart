import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green_taxi/screens/login/controller.dart';
import 'package:green_taxi/utilities/widgets/green_intro_widget.dart';
import 'package:green_taxi/utilities/widgets/login_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LoginController());
    return Scaffold(
      body: Container(
        height: Get.height.h,
        width: Get.width.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreenIntroWidget(),
              SizedBox(
                height: 50.h,
              ),
             LoginWidget(
                  controller.state.code,
                 () async {
                   final code = await controller.state.countryPicker.showPicker(context: context);
                   // Null check
                   if (code != null) controller.state.code = code;
                   setState(() {

                   });
                 }
             //         ()async {
             // final code = await controller.state.countryPicker.showPicker(context: context);
             // // Null check
             // if (code != null) controller.state.code.value = code;
             // setState(() {
             //
             // });

             // }

              ),
            ],
          ),
        ),
      ),
    );
  }
}
