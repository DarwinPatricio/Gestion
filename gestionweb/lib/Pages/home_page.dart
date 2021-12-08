import 'package:flutter/material.dart';
import 'package:gestionweb/Models/color.dart';
import 'package:gestionweb/Models/lettersize.dart';
import 'package:gestionweb/Models/ruta.dart';
import 'package:gestionweb/Models/users.dart';
import 'package:gestionweb/Provider/colores_provider.dart';
import 'package:gestionweb/Provider/fontsize_provider.dart';
import 'package:gestionweb/Provider/rutas_provider.dart';
import 'package:gestionweb/Provider/users_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RutasProvider rutasProvider = RutasProvider();
  List<Widget> listaw = [];
  bool _activo = false;
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
            ShowRoutes(),
            ShowColors(),
            ShowLetterSize(),
            ShowUsuarios(),
          ],
        ),
      ),
    );
  }
}

class ShowRoutes extends StatefulWidget {
  ShowRoutes({Key? key}) : super(key: key);

  @override
  _ShowRoutesState createState() => _ShowRoutesState();
}

class _ShowRoutesState extends State<ShowRoutes> {
  @override
  Widget build(BuildContext context) {
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
                              setState(() {
                                element.active = (value ? "1" : "0");
                                rutasProvider.setRutas(element);
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
}

class ShowColors extends StatefulWidget {
  @override
  _ShowColorsState createState() => _ShowColorsState();
}

class _ShowColorsState extends State<ShowColors> {
  late ColorM _coloractivo;
  ColorProvider colorProvider = ColorProvider();
  @override
  Widget build(BuildContext context) {
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
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: LinearProgressIndicator(),
                      );
                    } else {
                      _coloractivo = snapshot.data![0];
                      List<DropdownMenuItem<ColorM>> lista = [];
                      snapshot.data!.forEach((element) {
                        lista.add(DropdownMenuItem(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  element.color.substring(1),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: _colordfondo(element.color),
                                )
                              ],
                            ),
                            value: element));
                      });
                      return DropdownButton<ColorM>(
                        value: _coloractivo,
                        items: lista,
                        onChanged: (valor) {
                          setState(() {
                            _coloractivo = valor!;
                            colorProvider.setColor(_coloractivo);
                          });
                        },
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

  Color _colordfondo(String color) {
    switch (color) {
      case '.blue':
        return Colors.blue;
      case '.red':
        return Colors.red;
      case '.orange':
        return Colors.orange;
      case '.indigo':
        return Colors.indigo;
      case '.teal':
        return Colors.teal;
    }
    return Colors.black;
  }
}

class ShowLetterSize extends StatefulWidget {
  ShowLetterSize({Key? key}) : super(key: key);

  @override
  _ShowLetterSizeState createState() => _ShowLetterSizeState();
}

class _ShowLetterSizeState extends State<ShowLetterSize> {
  FontSizeProvider fontSizeProvider = FontSizeProvider();
  double tamanio = 10;
  @override
  Widget build(BuildContext context) {
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
                  'Tamaño de letra',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: fontSizeProvider.getSize(),
                  builder: (BuildContext context,
                      AsyncSnapshot<LetterSize> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LinearProgressIndicator();
                    } else {
                      print(snapshot.data);
                      tamanio = double.parse(snapshot.data!.tamanio);
                      return Slider(
                        value: tamanio,
                        label: '$tamanio',
                        divisions: 20,
                        onChanged: (valor) {
                          setState(() {
                            tamanio = valor;
                          });
                        },
                        max: 30,
                        min: 10.0,
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowUsuarios extends StatefulWidget {
  ShowUsuarios({Key? key}) : super(key: key);

  @override
  _ShowUsuariosState createState() => _ShowUsuariosState();
}

class _ShowUsuariosState extends State<ShowUsuarios> {
  UsersProvider usersProvider = UsersProvider();
  List<Widget> listaw = [];
  @override
  Widget build(BuildContext context) {
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
                  'Usuarios',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: usersProvider.getUsuarios(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Usuario>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      snapshot.data!.forEach((element) {
                        listaw.add(Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListTile(
                            title: Text(
                              '${element.firstName}',
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ));
                      });
                      return Column(
                        children: listaw,
                      );
                    }
                  },
                ), //TODO AÑADIR LA LISTA DE USUARIOS CON UN BOTN DE BORRAR
              ],
            ),
          ),
        ),
      ),
    );
  }
}
