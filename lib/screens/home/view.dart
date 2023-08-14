import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/screens/home/controller.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../login/state.dart';
class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  String? _mapStyle;
  void initState() {
    // super.initState();
    rootBundle.loadString('assets/map_style.txt').then((value) {
      _mapStyle = value;
    });
  }
  final CameraPosition _kGooglePlex =
      const CameraPosition(target: LatLng(32.07116, 72.70843), zoom: 14.4746);

  GoogleMapController? mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            top: 150,
            bottom: 0,
            right: 0,
            left: 0,
            child: GoogleMap(
              //when you apply custom map then map are not used
              // mapType: MapType.hybrid,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                mapController!.setMapStyle(_mapStyle);
              },
              initialCameraPosition: _kGooglePlex,
            ),
          ),
          buildProfileTile(),
          buildTextField(),
        ]),
      ),
    );
  }
}

Widget buildProfileTile() {
  return Positioned(
      top: 60,
      left: 20,
      right: 20,
      child: Container(
        width: Get.width,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 30,
              // child: ,
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'Good Morning, ',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  TextSpan(
                    text: 'Abdul Wahab',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ])),
                Text(
                  'Where are you going?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                )
              ],
            )
          ],
        ),
      ));
}
Widget buildTextField(){
  return Positioned(
    top: 170,
    left: 20,
    right: 20,
    child: Container(
      width: Get.width,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 4,
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        // validator: (String? input) {
        //   return validator(input);
        // },
        // controller: controller,
        // textInputAction: action,
        style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xffA7A7A7)),
        decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
                // color: AppColors.greenColor,
              ),
            ),
            border: InputBorder.none),
      ),
    ),
  );
}
