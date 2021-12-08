import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:gestionweb/Models/usuario_response.dart';
import 'package:gestionweb/Services/usuario_service.dart';
import 'package:octo_image/octo_image.dart';

class UsersPage extends StatefulWidget {
  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(child: _listaClientes()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'add');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _listaClientes() {
    UsuarioService usuarioService = UsuarioService();
    return FutureBuilder(
        future: usuarioService.getUsuarios(),
        builder: (BuildContext context, AsyncSnapshot<List<Usuario>> snapshot) {
          if (!snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCardExample(),
                    _buildCardExample(),
                    _buildCardExample(),
                    _buildCardExample(),
                    _buildCardExample(),
                    _buildCardExample()
                  ],
                ));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _usuarioCard(snapshot.data!)),
            );
          }
        });
  }

  List<Widget> _usuarioCard(List<Usuario> lista) {
    List<Widget> listWidget = [];
    lista.forEach((element) {
      listWidget.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 9,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              //width: 300,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 70,
                    height: 70,
                    // decoration: BoxDecoration(
                    //   color: Colors.grey.withOpacity(.6),
                    // ),
                    child: Center(
                      child: CircleAvatar(child: Text(element.userId)),
                      // child: FadeInImage(
                      //     image: NetworkImage(element.photo),
                      //     placeholder: AssetImage('assets/loading.png'))
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(element.username),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(element.firstName),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              element.lastName,
                            ),
                          ],
                        ),
                        Text(element.gender)
                      ],
                    ),
                  )
                ],
              ),
            )),
      ));
    });
    return listWidget;
  }

  _buildCardExample() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 9,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              //width: 300,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.6),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.photo_size_select_actual,
                        color: Colors.white,
                        size: 38,
                      ),
                    ),
                  ),
                  Expanded(
                    child: PlaceholderLines(
                      animate: true,
                      count: 3,
                    ),
                  )
                ],
              ),
            )));
  }
}
