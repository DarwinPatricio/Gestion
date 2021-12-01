import 'package:flutter/material.dart';
import 'package:gestionweb/Models/color.dart';
import 'package:gestionweb/Models/ruta.dart';
import 'package:gestionweb/Provider/colores_provider.dart';
import 'package:gestionweb/Provider/rutas_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _activo = false;
  String _coloractivo = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina de Gestión'),
        centerTitle: true,
      ),
      body: Center(
        child: Wrap(
          spacing: 5,
          alignment: WrapAlignment.center,
          children: [
            _showRutas(),
            _Colores(),
          ],
        ),
      ),
    );
  }

  Widget _showRutas() {
    RutasProvider rutasProvider = RutasProvider();
    List<Widget> listaw = [];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 300,
          decoration: BoxDecoration(color: Colors.blueGrey[100]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Rutas',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                FutureBuilder(
                  future: rutasProvider.getRutas(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Ruta>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      snapshot.data!.forEach((element) {
                        listaw.add(SwitchListTile(
                            title: Text('${element.titulo}'),
                            value: element.active == "1" ? true : false,
                            onChanged: (value) {
                              element.active = (value ? "1" : "0");
                              setState(() {
                                print(element.active);
                              });
                            }));
                      });
                      return Column(
                        children: listaw,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _Colores() {
    ColorProvider colorProvider = ColorProvider();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: 300,
          decoration: BoxDecoration(color: Colors.blueGrey[100]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Colores',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                FutureBuilder(
                  future: colorProvider.getColor(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ColorM>> snapshot) {
                    List<DropdownMenuItem<String>> lista = [];
                    snapshot.data!.forEach((element) {
                      lista.add(DropdownMenuItem(
                          child: Container(
                            decoration: BoxDecoration(
                              color: _colordondo(element.color),
                            ),
                            child: Text(element.color.substring(1)),
                          ),
                          value: element.color));
                    });
                    return DropdownButton<String>(
                      value: _coloractivo == ""
                          ? snapshot.data![0].color
                          : _coloractivo,
                      items: lista,
                      onChanged: (valor) {
                        setState(() {
                          _coloractivo = valor.toString();
                        });
                      },
                    );
                    ;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _colordondo(String color) {
    switch (color) {
      case '.blue':
        return Colors.blue;
        break;
      case '.red':
        return Colors.red;
        break;
      case '.orange':
        return Colors.orange;
        break;
      case '.indigo':
        return Colors.indigo;
        break;
      case '.teal':
        return Colors.teal;
        break;
    }
    return Colors.black;
  }
}
