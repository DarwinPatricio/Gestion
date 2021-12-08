import 'dart:convert';

import 'package:gestionweb/Models/ruta.dart';
import 'package:http/http.dart' as http;

class RutasProvider {
  Future<List<Ruta>> getRutas() async {
    List<Ruta> lista = [];
    print(lista.length);
    final respuesta = await http.get(Uri.parse(
        'https://falcondptoinformatica.synology.me/GestionDD/index.php/gestion/rutas'));
    List body = jsonDecode(respuesta.body);
    print(body);
    body.forEach((element) {
      lista.add(Ruta.fromJson(jsonEncode(element)));
    });
    return lista;
  }

  Future<bool> setRutas(Ruta ruta) async {
    String respuesta = '"id": "${ruta.id}", "active": "${ruta.active}"';
    final resp = await http.put(
        Uri.parse(
            "https://falcondptoinformatica.synology.me/GestionDD/index.php/gestion/rutas"),
        body: respuesta);
    print(resp.body);
    if (resp.statusCode != 200) {
      return false;
    }
    return true;
  }
}
