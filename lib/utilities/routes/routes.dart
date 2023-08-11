

import 'package:get/get.dart';
import 'package:green_taxi/utilities/routes/route_name.dart';

import '../../screens/login/index.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesNames.loginScreen,
      page: () => LoginView(),
      binding: LoginBindings(),
    ),
    // GetPage(
    //   name: RoutesNames.signUpScreen,
    //   page: () => SignUpScreen(),
    //   binding: SignUpBindings(),
    // ),
  ];
}
