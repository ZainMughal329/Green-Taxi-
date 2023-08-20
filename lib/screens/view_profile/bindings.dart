import 'package:get/get.dart';
import 'package:green_taxi/screens/profile/controller.dart';
import 'package:green_taxi/screens/view_profile/controller.dart';

class ViewProfileBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ViewProfileController>(() => ViewProfileController());
  }

}