import 'package:gestionweb/Models/rutas_response.dart';
import 'package:gestionweb/Models/usuario_response.dart';
import 'package:http/http.dart';

class UsuarioService {
  Future<List<Usuario>> getUsuarios() async {
    final resp = await get(Uri.parse(
        'https://falcondptoinformatica.synology.me/GestionDD/index.php/gestion/usuarios'));

    final usuarios = UsuarioResponse.fromJson('{"usuarios":${resp.body}}');

    return usuarios.usuarios;
  }
}
