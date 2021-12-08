import 'dart:convert';

import 'package:gestionweb/Models/color.dart';
import 'package:gestionweb/Models/ruta.dart';
import 'package:http/http.dart' as http;

class ColorProvider {
  Future<List<ColorM>> getColor() async {
    List<ColorM> lista = [];
    print(lista.length);
    final respuesta = await http.get(Uri.parse(
        'https://falcondptoinformatica.synology.me/GestionDD/index.php/gestion/colores'));
    List body = jsonDecode(respuesta.body);
    print(body);
    body.forEach((element) {
      lista.add(ColorM.fromJson(jsonEncode(element)));
    });
    return lista;
  }
}
