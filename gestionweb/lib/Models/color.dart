import 'dart:convert';

class ColorM {
  ColorM({
    required this.id,
    required this.color,
    required this.active,
  });

  String id;
  String color;
  String active;

  factory ColorM.fromJson(String str) => ColorM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ColorM.fromMap(Map<String, dynamic> json) => ColorM(
        id: json["id"],
        color: json["color"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "color": color,
        "active": active,
      };
}
