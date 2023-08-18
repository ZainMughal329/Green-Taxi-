import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:green_taxi/screens/home/state.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../utilities/utils/app_constants.dart';

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

  // function for auto search plces
  Future<String> showGoogleAutoComplete(BuildContext context) async {
    showSourceField(true);
    const KGoogleApiKey = "AIzaSyCaEiMGTAmMYlLZogzcwRUZwCkPspFp6zI";
    print('object431');
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        offset: 0,
        radius: 1000,
        strictbounds: false,
        region: "pk",
        language: "en",
        mode: Mode.overlay,
        apiKey: KGoogleApiKey,
        components: [new Component(Component.country, "pk")],
        types: [],
        hint: "Search City",
        onError: (err) {
          print('Error is : ' + err.toString());
        });
    return p!.description.toString();
  }

  // Future<Prediction?> showGoogleAutoComplete(BuildContext context) async {
  //   Prediction? p = await PlacesAutocomplete.show(
  //     offset: 0,
  //     radius: 1000,
  //     strictbounds: false,
  //     region: "pk",
  //     language: "en",
  //     context: context,
  //     mode: Mode.overlay,
  //     apiKey: AppConstants.kGoogleApiKey,
  //     components: [new Component(Component.country, "pk")],
  //     types: [],
  //     hint: "Search City",
  //     onError: (err) {
  //       print('Error' + err.status.toString());
  //       print('Error : ' + err.predictions.toString());
  //       print('Err : ' + err.toString());
  //     }
  //   );
  //
  //
  //   return p;
  // }


  showSourceField(bool value) {
    state.showSourceField.value = value;
  }
}
