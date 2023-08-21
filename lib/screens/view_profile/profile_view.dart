import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_taxi/screens/profile/controller.dart';
import 'package:green_taxi/screens/profile/state.dart';
import 'package:green_taxi/screens/view_profile/controller.dart';
import 'package:green_taxi/utilities/utils/app_colors.dart';
import '../../utilities/widgets/green_intro_widget_without_logo.dart';

class ViewProfileScreen extends GetView<ViewProfileController> {
  ViewProfileScreen({Key? key}) : super(key: key);

  // ProfileController profileController = Get.put(ProfileController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                    child: GetBuilder<ViewProfileController>(builder: (con) {
                      return GestureDetector(
                        onTap: () {
                          // con.getImage(ImageSource.camera);
                          con.showImage(context);
                        },
                        child: con.image == null
                            ? controller.con.myUser.value.image != null
                                ? Container(
                                    width: 120,
                                    height: 120,
                                    margin: EdgeInsets.only(bottom: 20),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(controller
                                                .con.myUser.value.image!),
                                            fit: BoxFit.fill),
                                        shape: BoxShape.circle,
                                        color: Color(0xffD6D6D6)),
                                  )
                                : Container(
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
                                    fit: BoxFit.cover,
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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ReusedTextFormField(
                      'Name',
                      Icons.person_outline,
                      TextInputAction.next,
                      controller.state.nameController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Name is required!';
                        }

                        if (input.length < 3) {
                          return 'Length must be greater then 3!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusedTextFormField(
                      'Home Address',
                      Icons.home_outlined,
                      TextInputAction.next,
                      controller.state.homeController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Home Address is required!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusedTextFormField(
                      'Business Address',
                      Icons.card_travel,
                      TextInputAction.next,
                      controller.state.businessController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Business Address is required!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ReusedTextFormField(
                      'Shopping Center',
                      Icons.shopping_cart,
                      TextInputAction.done,
                      controller.state.shopController,
                      (String? input) {
                        if (input!.isEmpty) {
                          return 'Shopping center address is required!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    greenButton(
                      'Update',

                      Function,
                      () {
                        if (!formKey.currentState!.validate()) {
                          return null;
                        }

                        controller.showUserInfo(
                          controller.image,
                          controller.state.nameController.text,
                          controller.state.homeController.text,
                          controller.state.businessController.text,
                          controller.state.shopController.text,
                          url: controller.con.myUser.value.image ?? "",
                        );
                      },
                      controller.state.isLoading.value,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

ReusedTextFormField(String tittle, IconData iconData, TextInputAction action,
    TextEditingController controller, Function validator) {
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
        child: TextFormField(
          validator: (String? input) {
            return validator(input);
          },
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

Widget greenButton(String tittle, Function, onPrssed , bool isLoading) {
  return MaterialButton(
    minWidth: Get.width,
    height: 50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    color: AppColors.greenColor,
    child: isLoading == true ? Center(
      child: CircularProgressIndicator(),
    ) : Text(
      tittle,
      style: GoogleFonts.poppins(
          fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffD6D6D6)),
    ),
    onPressed: () => onPrssed(),
  );
}
