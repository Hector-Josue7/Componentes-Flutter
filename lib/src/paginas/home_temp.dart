import 'package:flutter/material.dart';

// el snippet a utilizar es stle -> Flutter stateless widget
class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('ListTile Titulo axn'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Titulo axn'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Titulo axn'),
          )
        ],
      ),
    );
  }
}
