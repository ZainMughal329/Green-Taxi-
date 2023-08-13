import 'package:get/get.dart';
import 'package:green_taxi/screens/profile/controller.dart';

class ProfileBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfileController>(() => ProfileController());
  }

}