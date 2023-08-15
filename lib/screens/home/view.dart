import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:green_taxi/screens/home/controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 150,
              bottom: 0,
              right: 0,
              left: 0,
              child: GoogleMap(
                //when you apply custom map then map are not used
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController con) {
                  controller.state.mapController = con;
                  controller.state.mapController!
                      .setMapStyle(controller.state.mapStyle);
                },
                initialCameraPosition: controller.state.kGooglePlex,
              ),
            ),
            buildProfileTile(),
            buildTextField(),
            buildLocationIcon(),
            buildNotificationIcon(),
            buildBottomSheet(),
          ],
        ),
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
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.5),
            ),
            child: Center(
              child: Icon(
                Icons.person,
                size: 30,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
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
                  ],
                ),
              ),
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
    ),
  );
}

Widget buildTextField() {
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
      child: Padding(
        padding: EdgeInsets.only(
          left: 15,
        ),
        child: TextFormField(
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffA7A7A7)),
          decoration: InputDecoration(
              hintStyle: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              hintText: 'Search for destination',
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
    ),
  );
}

Widget buildLocationIcon() {
  return Align(
    alignment: Alignment.bottomRight,
    child: Padding(
      padding: EdgeInsets.only(bottom: 30, right: 8),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.green,
        child: Center(
          child: Icon(
            Icons.my_location,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}


Widget buildNotificationIcon() {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Padding(
      padding: EdgeInsets.only(bottom: 30, left: 8),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Center(
          child: Icon(
            Icons.notifications,
            color: Color(0xffC3CDD6),
          ),
        ),
      ),
    ),
  );
}

Widget buildBottomSheet() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: Get.width * 0.6,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: Center(
        child: Container(
          height: 4,
          width: Get.width*0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),

        ),
      ),
    ),
  );
}