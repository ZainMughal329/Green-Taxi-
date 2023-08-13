import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:green_taxi/screens/login/otp_verification_screen.dart';
import 'package:green_taxi/screens/login/state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:green_taxi/utilities/routes/route_name.dart';

class LoginController extends GetxController {
  final state = LoginState();

  LoginController();

  phoneAuth(String phone) async {
    try {
      print('Phone Number is : ' + phone);
      state.credentials = null;
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (PhoneAuthCredential credential) async {
            print('Completed');
            state.credentials = credential;
            await FirebaseAuth.instance.signInWithCredential(credential);
          },
          forceResendingToken: state.resendTokenId,
          verificationFailed: (FirebaseAuthException e) {
            print('Failed + ' + e.toString());
            if (e.code == 'invalid-phone-number') {
              debugPrint('The phone number is not valid');
            }
          },
          codeSent: (String verificationId, int? resendToken) async {
            print('Code sent');
            state.verId = verificationId;
            state.resendTokenId = resendToken;
          },
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      print('Error occurs : ' + e.toString());
    }
  }

  onSubmit(String? input) {
    Get.to(
      () => OTPverificationScreen(
        phoneNumber: state.code.dialCode + input!,
      ),
    );
  }

  verifyOtp(String otpNumber) async {
    print('Called');
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: state.verId, smsCode: otpNumber);
    print('Logged in');
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  decideRoute() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      FirebaseFirestore.instance.collection('users').doc(user.uid).get().then(
        (value) {
          if (value.exists) {
            Get.toNamed(RoutesNames.HomeScreen);
          } else {
            Get.toNamed(RoutesNames.profileScreen);
          }
        },
      );
    }
  }
}
