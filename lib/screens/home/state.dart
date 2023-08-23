
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeState{

  // Rx<GoogleMapController>myMapController =GoogleMapController().obs;
  String? mapStyle;
  TextEditingController placeController = TextEditingController();
  TextEditingController sourceController =TextEditingController();
  final CameraPosition kGooglePlex =
  const CameraPosition(target: LatLng(32.07116, 72.70843), zoom: 14.4746);

  RxBool showSourceField = false.obs;

  late LatLng destination;
  late LatLng source;

  late Uint8List markIcons;

  final Set<Polyline> set={};
  Set<Marker> markers=Set<Marker>();
  GoogleMapController? mapController;


}