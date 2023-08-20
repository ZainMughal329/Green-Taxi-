import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import'package:firebase_auth/firebase_auth.dart';
class ViewProfileState{
  final nameController = TextEditingController();
  final homeController = TextEditingController();
  final businessController = TextEditingController();
  final shopController = TextEditingController();
  RxBool isLoading = false.obs;
}