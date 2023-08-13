import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileState{

  final nameController = TextEditingController().obs;
  final homeController = TextEditingController().obs;
  final businessController = TextEditingController().obs;
  final shopController = TextEditingController().obs;

  RxBool isLoading = false.obs;
}