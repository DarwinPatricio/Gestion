import 'package:flutter/material.dart';

import 'Pages/home_page.dart';
import 'Routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: getAplicacionesRoutes(),
      home: MyHomePage(),
    );
  }
}
