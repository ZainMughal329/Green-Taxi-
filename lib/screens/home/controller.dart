import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:green_taxi/screens/home/state.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:green_taxi/utilities/utils/app_colors.dart';

import '../../utilities/utils/app_constants.dart';
class HomeController extends GetxController {
  final state = HomeState();
  HomeController();
  buildDrawerItem({
    required String tittle,required Function onpresed,Color =Colors.black,double fontSize=20,
     FontWeight fontWeight = FontWeight.w700,double height =45, bool isVisible = false
}){
    return SizedBox(
      height: height,
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        dense: true,
        onTap: ()=>onpresed(),
        title: Row(
          children: [
            Text(tittle,style: GoogleFonts.poppins(fontSize: fontSize,fontWeight: fontWeight,color:Color ),),
            SizedBox(width: 5,),
            isVisible ? CircleAvatar(backgroundColor: AppColors.greenColor,radius: 15,
            child: Text('1',style: GoogleFonts.poppins(color: Colors.white),),):Container()
          ],
        ),
      ),
    );
  }
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
