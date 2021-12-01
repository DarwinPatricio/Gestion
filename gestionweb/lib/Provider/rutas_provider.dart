import 'dart:convert';

import 'package:gestionweb/Models/ruta.dart';
import 'package:http/http.dart' as http;

class RutasProvider {
  Future<List<Ruta>> getRutas() async {
    List<Ruta> lista = [];
    print(lista.length);
    final respuesta = await http.get(
        Uri.parse('http://192.168.23.223/GestionAPP/index.php/Gestion/rutas'));
    List body = jsonDecode(respuesta.body);
    print(body);
    body.forEach((element) {
      lista.add(Ruta.fromJson(jsonEncode(element)));
    });
    return lista;
  }
}
