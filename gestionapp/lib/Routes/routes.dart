import 'package:flutter/material.dart';
import 'package:gestionweb/Pages/home_page.dart';
import 'package:gestionweb/Pages/info_page.dart';
import 'package:gestionweb/Pages/location_page.dart';
import 'package:gestionweb/Pages/users_page.dart';

Map<String, WidgetBuilder> getAplicacionesRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => MyHomePage(),
    'usuario_page': (BuildContext context) => UsersPage(),
    'info_page': (BuildContext context) => InfoPage(),
    'location_page': (BuildContext context) => LocationPage(),
  };
}
