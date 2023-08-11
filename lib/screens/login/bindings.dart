import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:green_taxi/screens/login/controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }

}