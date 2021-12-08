import 'package:gestionweb/Models/rutas_response.dart';
import 'package:http/http.dart';

class RutaService {
  Future<List<dynamic>> getRutas() async {
    final resp = await get(Uri.parse(
        'https://falcondptoinformatica.synology.me/GestionDD/index.php/gestion/rutas'));

    final rutas = RutasResponse.fromJson('{"rutas":${resp.body}}');

    return rutas.rutas;
  }
}
