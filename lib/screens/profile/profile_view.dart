import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_taxi/screens/profile/controller.dart';
import 'package:green_taxi/screens/profile/state.dart';
import 'package:green_taxi/utilities/utils/app_colors.dart';
import '../../utilities/widgets/green_intro_widget_without_logo.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  greenIntroWidgetWithOutLogo(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffD6D6D6)),
                      child: Center(
                        child: Icon(Icons.camera_alt_outlined,size: 40,color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 23
              ),
              child: Column(
                children:[
                  TextFormField('Name',Icons.person_outline,ProfileState().nameController.value),
                  SizedBox(height: 10,),
                  TextFormField('Home Address',Icons.home_outlined,ProfileState().homeController.value),
                  SizedBox(height: 10,),
                  TextFormField('Business Address',Icons.card_travel,ProfileState().businessController.value),
                SizedBox(height: 10,),
                  TextFormField('Shopping Center',Icons.shopping_cart,ProfileState().shopController.value),
                  SizedBox(height: 10,),
                 Obx((){
                   ProfileState().isLoading.value?Center(child: CircularProgressIndicator()):greenButton('Submit',(){
                   });
                 })

                ]
              ),
            )
          ]
        )));
  }
}
TextFormField(String tittle,IconData iconData,TextEditingController controller){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
      tittle,style: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,color: Color(0xffA7A7A7)
    ),
    ) ,
    SizedBox(
      height: 6,
    )  ,
      Container(
        width: Get.width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 1
            )
          ],
          borderRadius: BorderRadius.circular(8)

        ),
        child: TextField(
          style: GoogleFonts.poppins(
          fontSize: 14,
  fontWeight: FontWeight.w600,color: Color(0xffA7A7A7)),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(iconData,color: AppColors.greenColor,),
            ),
            border: InputBorder.none
          ),
        ),
      )
    ],
  );
}
Widget greenButton(String tittle,Function,onPrssed){
  return MaterialButton(
      minWidth: Get.width,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      color: AppColors.greenColor,
      child: Text(
          tittle,style:GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xffD6D6D6)
      ) ,
      ),


      onPressed: ()=>onPrssed);

}