import 'dart:convert';

import 'package:gestionweb/Models/users.dart';
import 'package:http/http.dart' as http;

class UsersProvider {
  Future<List<Usuario>> getUsuarios() async {
    List<Usuario> lista = [];
    final resp = await http.get(Uri.parse(
        "https://falcondptoinformatica.synology.me/GestionDD/index.php/gestion/usuarios"));
    List body = jsonDecode(resp.body);
    body.forEach((element) {
      lista.add(Usuario.fromJson(jsonEncode(element)));
    });
    return lista;
  }
}
