import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_taxi/screens/login/controller.dart';
import 'package:pinput/pinput.dart';
class RoundWithShadow extends StatefulWidget {

  const RoundWithShadow({Key? key}) : super(key: key);

  @override
  State<RoundWithShadow> createState() => _RoundWithShadowState();
  @override
  String toStringShort()=> 'Rounded with Shadow';
}

class _RoundWithShadowState extends State<RoundWithShadow> {
  final controlller = TextEditingController();
  final focousnode = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    controlller.dispose();
    focousnode.dispose();
    super.dispose();
  }

  LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(83, 84, 86, 1.0)),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      length: 6,

      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      // validator: (s) {
      //   // return s == '2222' ? null : 'Pin is incorrect';
      // },

      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (String input) {
        loginController.verifyOtp(input);
      },
    );
  }
}
