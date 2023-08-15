class Stylers {
  Stylers({
      required this.color,});

  Stylers.fromJson(dynamic json) {
    color = json['color'];
  }
  String color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['color'] = color;
    return map;
  }

}