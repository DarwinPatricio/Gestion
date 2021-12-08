import 'package:flutter/material.dart';
import 'package:gestionweb/Services/ruta_service.dart';
import 'package:gestionweb/Utils/icon_string_util.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    RutaService rutaService = RutaService();
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: FutureBuilder(
          initialData: [],
          future: rutaService.getRutas(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return listaMenu(snapshot.data!, context);
            } else {
              return CircularProgressIndicator.adaptive();
            }
          },
        ));
  }

  Widget listaMenu(List<dynamic> rutas, BuildContext context) {
    List<Widget> lista = [];
    rutas.forEach((element) {
      if (element.active == '1') {
        print(getIcon(element.icon));
        final widgetTemp = ListTile(
          title: Text(element.titulo),
          subtitle: Text(element.subtitle),
          leading: getIcon(element.icon),
          onTap: () {
            Navigator.pushNamed(context, element.page,
                arguments: element.appbartitulo);
          },
        );
        lista.add(widgetTemp);
      }
    });
    return Column(
      children: lista,
    );
  }
}
