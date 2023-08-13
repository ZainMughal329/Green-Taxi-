import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:green_taxi/screens/login/controller.dart';
import 'package:green_taxi/utilities/routes/route_name.dart';
import 'package:green_taxi/utilities/routes/routes.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    loginController.decideRoute();
    return ScreenUtilInit(
        builder: (context, child) {
          return  GetMaterialApp(
          title: 'Flutter Demo',
          initialRoute: RoutesNames.loginScreen,
          getPages: AppPages.routes,
        );
      }
    );
  }
}
