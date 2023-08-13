import 'package:get/get.dart';
import 'package:green_taxi/screens/home/index.dart';
import 'package:green_taxi/utilities/routes/route_name.dart';

import '../../screens/login/index.dart';
import '../../screens/profile/index.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesNames.loginScreen,
      page: () => LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: RoutesNames.profileScreen,
      page: () => ProfileScreen(),
      binding: ProfileBindings(),
    ),
    GetPage(
      name: RoutesNames.HomeScreen,
      page: () => HomeView(),
      binding: HomeBindings(),
    ),
  ];
}
