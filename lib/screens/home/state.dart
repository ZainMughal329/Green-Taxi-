import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeState{

  // Rx<GoogleMapController>myMapController =GoogleMapController().obs;
  String? mapStyle;

  final CameraPosition kGooglePlex =
  const CameraPosition(target: LatLng(32.07116, 72.70843), zoom: 14.4746);

  GoogleMapController? mapController;


}