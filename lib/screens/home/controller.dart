import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:green_taxi/screens/home/state.dart';
import 'package:flutter/services.dart' show rootBundle;

class HomeController extends GetxController {
  final state = HomeState();

  HomeController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    rootBundle.loadString('assets/map_style.txt').then(
      (value) {
        state.mapStyle = value;
      },
    );
  }

  //function for auto search plces
  Future<String> showGoogleAutoComplete(BuildContext context) async{
    const KGoogleApiKey = "AIzaSyDoPV0UJr5sKwvcbiXxOp8wW9Y5axSHBMM";
    Prediction?  p =await PlacesAutocomplete.show(context: context,
    offset: 0,
    radius: 1000,
    strictbounds: false,
    region: "us",
        language: "en",
    mode: Mode.overlay,
        apiKey: KGoogleApiKey,
      components: [new Component(Component.country, "en")],
        types: ["(cities)"],
      hint: "Search City"

    );
  }
}