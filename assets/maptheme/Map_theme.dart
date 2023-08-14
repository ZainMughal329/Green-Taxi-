import 'Stylers.dart';

class MapTheme {
  MapTheme({
      this.elementType, 
      this.stylers,});

  MapTheme.fromJson(dynamic json) {
    elementType = json['elementType'];
    if (json['stylers'] != null) {
      stylers = [];
      json['stylers'].forEach((v) {
        stylers.add(Stylers.fromJson(v));
      });
    }
  }
  String elementType;
  List<Stylers> stylers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['elementType'] = elementType;
    if (stylers != null) {
      map['stylers'] = stylers.map((v) => v.toJson()).toList();
    }
    return map;
  }

}