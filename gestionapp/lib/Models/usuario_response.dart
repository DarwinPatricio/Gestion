// To parse this JSON data, do
//
//     final usuarioResponse = usuarioResponseFromMap(jsonString);

import 'dart:convert';

class UsuarioResponse {
  UsuarioResponse({
    required this.usuarios,
  });

  List<Usuario> usuarios;

  factory UsuarioResponse.fromJson(String str) =>
      UsuarioResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioResponse.fromMap(Map<String, dynamic> json) => UsuarioResponse(
        usuarios:
            List<Usuario>.from(json["usuarios"].map((x) => Usuario.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "usuarios": List<dynamic>.from(usuarios.map((x) => x.toMap())),
      };
}

class Usuario {
  Usuario({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.password,
    required this.status,
    required this.active,
  });

  String userId;
  String username;
  String firstName;
  String lastName;
  String gender;
  String password;
  String status;
  String active;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        userId: json["user_id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        password: json["password"],
        status: json["status"],
        active: json["active"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "password": password,
        "status": status,
        "active": active,
      };
}
