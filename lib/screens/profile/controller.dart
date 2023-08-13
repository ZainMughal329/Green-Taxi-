import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_taxi/screens/profile/state.dart';
import 'package:green_taxi/utilities/routes/route_name.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class ProfileController extends GetxController {
  final state = ProfileState();
  ProfileController();
//  Function to pick image;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  XFile? _image;

  XFile? get image => _image;
  final ImagePicker picker = ImagePicker();


  void setLoading(bool value) {
    state.isLoading.value = value;
  }

  Future pickedImageFromGallery(BuildContext context) async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    if (pickedImage != null) {
      _image = XFile(pickedImage.path);
      // uploadImage(context, userModel);
      update();
    }
  }

  //
  Future pickedImageFromCamera(BuildContext context) async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    if (pickedImage != null) {
      _image = XFile(pickedImage.path);
      // uploadImage(context, userModel);
      update();
    }
  }

  void showImage(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: 130,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                ListTile(
                  onTap: () {
                    pickedImageFromCamera(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.camera),
                  title: Text('Camera'),
                ),
                ListTile(
                  onTap: () {
                    pickedImageFromGallery(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.image),
                  title: Text('Gallery'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  uploadImage(File image) async {
    String userProfileImage = '';
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/profileImage' + DateTime.now().toString());
    firebase_storage.UploadTask uploadTask =
        storageRef.putFile(File(image!.path).absolute);

    await Future.value(uploadTask);

    await storageRef.getDownloadURL().then((value) {
      userProfileImage = value;
      print('Download url is : ' + value.toString());
    });
    return userProfileImage;
  }
  storeUserInfo(String name,String home ,String business,String shop) async {
    print('object');
    setLoading(true);
    String url = await uploadImage(File(image!.path).absolute);
    print('url is : ' + url.toString());
    String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    print('object11');
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'image': url,
      'name': state.nameController.value.text,
      'home_address': state.homeController.value.text,
      'business_address': state.businessController.value.text,
      'shopping_address': state.shopController.value.text,
    }).then((value) {
      print('object1122');
      state.nameController.value.clear();
      state.businessController.value.clear();
      state.homeController.value.clear();
      state.shopController.value.clear();
      Get.toNamed(RoutesNames.HomeScreen);
      setLoading(false);
    });
  }
  showUserInfo() async {
    print('object');
    setLoading(true);
    String url = await uploadImage(File(image!.path).absolute);
    print('url is : ' + url.toString());
    String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    print('object11');
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      'image': url,
      'name': state.nameController.value.text,
      'home_address': state.homeController.value.text,
      'business_address': state.businessController.value.text,
      'shopping_address': state.shopController.value.text,
    }).then((value) {
      print('object1122');
      state.nameController.value.clear();
      state.businessController.value.clear();
      state.homeController.value.clear();
      state.shopController.value.clear();
      Get.toNamed(RoutesNames.HomeScreen);
      setLoading(false);
    });
  }
}
