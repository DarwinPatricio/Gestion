import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gestionweb/Models/ruta.dart';
import 'package:gestionweb/Provider/rutas_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //{id: 2, active: 1, icon: minus, page: info_page, subtitle: Pagina de informacion, titulo: Informacion, appbartitulo: Informacion}
  List<Ruta> lista = [
    Ruta(
        id: '0',
        active: '0',
        icon: 'minus',
        page: 'location_page',
        subtitle: 'Pagina de localizacion',
        titulo: 'Localizacion',
        appbartitulo: 'Localizacion'),
    Ruta(
        id: '1',
        active: '1',
        icon: 'minus',
        page: 'usuario_page',
        subtitle: 'Usuarios page',
        titulo: 'Usuarios',
        appbartitulo: 'Usuarios')
  ];
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
            _rutas2(),
          ],
        ),
      ),
    );
  }
/* 
  Widget _rutas() {
    RutasProvider rutasProvider = RutasProvider();
    return FutureBuilder(
      future: rutasProvider.getRutas(),
      builder: (BuildContext context, AsyncSnapshot<List<Ruta>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          Ruta usuario = new Ruta.fromJson(snapshot.data![1].toJson());
          bool valor = usuario.active == '1' ? true : false;
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: 300,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'Rutas',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                        title: Text('${usuario.titulo}'),
                        value: usuario.active == "1" ? true : false,
                        onChanged: (value) {
                          usuario.active = (value ? "1" : "0");
                          setState(() {});
                        }),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  } */

  Widget _rutas2() {
    Ruta usuario = lista[0];
    Ruta usuario2 = lista[1];
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: 300,
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Rutas',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SwitchListTile(
                  title: Text('${usuario.titulo}'),
                  value: usuario.active == "1" ? true : false,
                  onChanged: (value) {
                    usuario.active = (value ? "1" : "0");
                    setState(() {
                      print(usuario.active);
                    });
                  }),
              SwitchListTile(
                  title: Text('${usuario2.titulo}'),
                  value: usuario2.active == "1" ? true : false,
                  onChanged: (value) {
                    usuario2.active = (value ? "1" : "0");
                    setState(() {
                      print(usuario2.active);
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
