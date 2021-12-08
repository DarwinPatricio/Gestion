// To parse this JSON data, do
//
//     final rutasResponse = rutasResponseFromMap(jsonString);

import 'dart:convert';

class RutasResponse {
  RutasResponse({
    required this.rutas,
  });

  List<Ruta> rutas;

  factory RutasResponse.fromJson(String str) =>
      RutasResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RutasResponse.fromMap(Map<String, dynamic> json) => RutasResponse(
        rutas: List<Ruta>.from(json["rutas"].map((x) => Ruta.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "rutas": List<dynamic>.from(rutas.map((x) => x.toMap())),
      };
}

class Ruta {
  Ruta({
    this.id,
    this.active,
    this.icon,
    this.page,
    this.subtitle,
    this.titulo,
    this.appbartitulo,
  });

  String? id;
  String? active;
  String? icon;
  String? page;
  String? subtitle;
  String? titulo;
  String? appbartitulo;

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

  @override
  String toString() {
    // TODO: implement toString
    return 'Ruta: ${page}';
  }
}
