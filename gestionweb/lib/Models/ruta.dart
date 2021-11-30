import 'dart:convert';

class Ruta {
  Ruta({
    required this.id,
    required this.active,
    required this.icon,
    required this.page,
    required this.subtitle,
    required this.titulo,
    required this.appbartitulo,
  });

  String id;
  String active;
  String icon;
  String page;
  String subtitle;
  String titulo;
  String appbartitulo;

  factory Ruta.fromJson(String str) => Ruta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ruta.fromMap(Map<String, dynamic> json) => Ruta(
        id: json["id"],
        active: json["active"],
        icon: json["icon"],
        page: json["page"],
        subtitle: json["subtitle"],
        titulo: json["titulo"],
        appbartitulo: json["appbartitulo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "active": active,
        "icon": icon,
        "page": page,
        "subtitle": subtitle,
        "titulo": titulo,
        "appbartitulo": appbartitulo,
      };
}
