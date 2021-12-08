import 'package:flutter/material.dart';

final _iconos = <String, IconData>{
  'public': Icons.public,
  'account_circle': Icons.account_circle,
  'info': Icons.info
};

Icon getIcon(String nombre) {
  return Icon(_iconos[nombre], color: Colors.blue);
}
