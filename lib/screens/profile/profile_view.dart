import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_taxi/screens/profile/controller.dart';
import 'package:green_taxi/utilities/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilities/widgets/green_intro_widget_without_logo.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  // ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  greenIntroWidgetWithOutLogo(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GetBuilder<ProfileController>(builder: (con) {
                      return GestureDetector(
                        onTap: () {
                          // con.getImage(ImageSource.camera);
                          controller.showImage(context);
                        },
                        child: controller.image == null
                            ? Container(
                                width: 120,
                                height: 120,
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffD6D6D6)),
                                child: Center(
                                  child: Icon(Icons.camera_alt_outlined,
                                      size: 40, color: Colors.white),
                                ),
                              )
                            : Container(
                                width: 120,
                                height: 120,
                                margin: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffD6D6D6),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(con.image!.path).absolute,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                      );
                    }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  TextFormField(
                      'Name',
                      Icons.person_outline,
                      TextInputAction.next,
                      controller.state.nameController.value),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      'Home Address',
                      Icons.home_outlined,
                      TextInputAction.next,
                      controller.state.homeController.value),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      'Business Address',
                      Icons.card_travel,
                      TextInputAction.next,
                      controller.state.businessController.value),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                      'Shopping Center',
                      Icons.shopping_cart,
                      TextInputAction.done,
                      controller.state.shopController.value),
                  SizedBox(
                    height: 20,
                  ),
                  greenButton(
                    'Submit',
                    Function,
                    () {
                      // controller.state.isLoading
                      //     ? Center(
                      //         child: CircularProgressIndicator(),
                      //       )
                      //     :
                      controller.showUserInfo();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

TextFormField(String tittle, IconData iconData, TextInputAction action,
    TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        tittle,
        style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffA7A7A7)),
      ),
      SizedBox(
        height: 6,
      ),
      Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 1)
            ],
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          controller: controller,
          textInputAction: action,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: AppColors.greenColor,
                ),
              ),
              border: InputBorder.none),
        ),
      )
    ],
  );
}

Widget greenButton(String tittle, Function, onPrssed) {
  return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      color: AppColors.greenColor,
      child: Text(
        tittle,
        style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xffD6D6D6)),
      ),
      onPressed: () {
        onPrssed();
      });
}
