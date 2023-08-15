import 'package:get/get.dart';
import 'package:green_taxi/screens/home/state.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeController extends GetxController {
  final state = HomeState();

  HomeController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    rootBundle.loadString('assets/map_style.txt').then(
      (value) {
        state.mapStyle = value;
      },
    );
  }
}
