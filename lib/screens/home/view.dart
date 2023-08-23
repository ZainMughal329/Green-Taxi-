import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:green_taxi/screens/home/controller.dart';
import 'package:green_taxi/screens/home/state.dart';
import 'package:green_taxi/utilities/routes/route_name.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;
import '../../utilities/utils/app_colors.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  Widget buildTextField(BuildContext context) {
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
            controller: controller.state.placeController,
            readOnly: true,
            onTap: () async {
              Get.back();
              dynamic p = await controller.showGoogleAutoComplete(context);
              print('object43re');
              String selectedPlace = p!.description.toString();
              // destinationController.text = selectedPlace;
              print('place:' + selectedPlace);
              controller.state.placeController.text = selectedPlace;
              List<geoCoding.Location> location =
                  await geoCoding.locationFromAddress(selectedPlace);
              controller.state.source =
                  LatLng(location.first.latitude, location.first.longitude);
              if(controller.state.markers.length>=2){
                controller.state.markers.remove(controller.state.markers.last);
              }
              controller.state.markers.add(
                Marker(
                    markerId: MarkerId(selectedPlace),
                    infoWindow: InfoWindow(title: 'Destination:$selectedPlace'),
                    position: controller.state.source,
                  icon: BitmapDescriptor.fromBytes(controller.state.markIcons)
                ),
              );
              controller.drawPolyLine(selectedPlace);
              controller.state.mapController!.animateCamera(
                CameraUpdate.newCameraPosition(CameraPosition(target: controller.state.source,zoom: 14))
              );
               HomeState().showSourceField.value = true;
            },
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
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

  Widget buildTextFieldForSource() {
    return Positioned(
      top: 230,
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
            controller: HomeState().sourceController,
            readOnly: true,
            onTap: () {
              Get.bottomSheet(Container(
                height: Get.height + 0.5,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ));
            },
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xffA7A7A7)),
            decoration: InputDecoration(
                hintStyle: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                hintText: 'Form',
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

  Widget buildBottomSheet(BuildContext context) {
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
            width: Get.width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Select Your Location",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Home Address",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            spreadRadius: 4,
                            blurRadius: 10),
                      ]),
                  child: Row(children: [
                    Text(
                      'NST, SARGODHA',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Business Address",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: Get.width,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            spreadRadius: 4,
                            blurRadius: 10),
                      ]),
                  child: Row(children: [
                    Text(
                      'Rehman Plaza, SARGODHA',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    String place =
                        await HomeController().showGoogleAutoComplete(context);
                    HomeState().sourceController.text = place;
                  },
                  child: Center(
                    child: Container(
                      width: Get.width,
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                spreadRadius: 4,
                                blurRadius: 10),
                          ]),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Search For Address',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProfileTile() {
    return Positioned(
      top: 60,
      left: 20,
      right: 20,
      child: Obx(
        () => controller.myUser.value.name == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                width: Get.width,
                child: Row(
                  children: [
                    controller.myUser.value.image == null
                        ? Container(
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
                          )
                        : Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      controller.myUser.value.image!),
                                  fit: BoxFit.fill),
                              // color: Colors.grey.withOpacity(0.5),
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              TextSpan(
                                text: controller.myUser.value.name,
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
      ),
    );
  }

  buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(RoutesNames.viewProfileScreen);
            },
            child: Obx(() => Container(
                  height: 150,
                  child: DrawerHeader(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      controller.myUser.value.image == null
                          ? Container(
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
                            )
                          : Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        controller.myUser.value.image!),
                                    fit: BoxFit.fill),
                                // color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Good Morning',
                            style: GoogleFonts.poppins(
                                color: Colors.black.withOpacity(0.28),
                                fontSize: 12),
                          ),
                          Text(
                            controller.myUser.value.name == null
                                ? 'Mark'
                                : controller.myUser.value.name!,
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  )),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                buildDrawerItem(tittle: 'Payment History', onpresed: () {}),
                buildDrawerItem(
                    tittle: 'Ride History', onpresed: () {}, isVisible: true),
                buildDrawerItem(tittle: 'Invite Friends', onpresed: () {}),
                buildDrawerItem(tittle: 'Promo Codes', onpresed: () {}),
                buildDrawerItem(tittle: 'Settings', onpresed: () {}),
                buildDrawerItem(tittle: 'Support', onpresed: () {}),
                buildDrawerItem(tittle: 'Log Out', onpresed: () {}),
              ],
            ),
          ),
          Spacer(),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                buildDrawerItem(
                    tittle: 'Do More',
                    onpresed: () {},
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    Color: Colors.black.withOpacity(0.15),
                    height: 20),
                SizedBox(
                  height: 20,
                ),
                buildDrawerItem(
                    tittle: 'Get Food Delivery',
                    onpresed: () {},
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    Color: Colors.black.withOpacity(0.15),
                    height: 20),
                buildDrawerItem(
                    tittle: 'Make Money Driving',
                    onpresed: () {},
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    Color: Colors.black.withOpacity(0.15),
                    height: 20),
                buildDrawerItem(
                    tittle: 'Rate Us On store',
                    onpresed: () {},
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    Color: Colors.black.withOpacity(0.15),
                    height: 20)
              ],
            ),
          )
        ],
      ),
    );
  }

  buildDrawerItem(
      {required String tittle,
      required Function onpresed,
      Color = Colors.black,
      double fontSize = 20,
      FontWeight fontWeight = FontWeight.w700,
      double height = 45,
      bool isVisible = false}) {
    return SizedBox(
      height: height,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        dense: true,
        onTap: () => onpresed(),
        title: Row(
          children: [
            Text(
              tittle,
              style: GoogleFonts.poppins(
                  fontSize: fontSize, fontWeight: fontWeight, color: Color),
            ),
            SizedBox(
              width: 5,
            ),
            isVisible
                ? CircleAvatar(
                    backgroundColor: AppColors.greenColor,
                    radius: 15,
                    child: Text(
                      '1',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
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
                markers: controller.state.markers,
                onMapCreated: (GoogleMapController con) {
                  controller.state.mapController = con;
                  controller.state.mapController!
                      .setMapStyle(controller.state.mapStyle);
                },
                initialCameraPosition: controller.state.kGooglePlex,
              ),
            ),
            buildProfileTile(),
            buildTextField(context),
            HomeState().showSourceField.value
                ? buildTextFieldForSource()
                : Container(),
            buildLocationIcon(),
            buildNotificationIcon(),
            // buildBottomSheet(context),
          ],
        ),
      ),
    );
  }
}
