import 'dart:convert';

import 'package:gestionweb/Models/lettersize.dart';
import 'package:http/http.dart' as http;

class FontSizeProvider {
  Future<LetterSize> getSize() async {
    final resp = await http.get(Uri.parse(
        "https://falcondptoinformatica.synology.me/GestionDD/index.php/gestion/letra"));
    List letras = jsonDecode(resp.body);
    print(letras[0]);
    LetterSize size = LetterSize.fromJson(jsonEncode(letras[0]));
    return size;
  }

  Future<bool> setSize(LetterSize ruta) async {
    return true;
  }
}
