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
          // children: _crearItems()
          children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    // este metodo se encarga de retornar la lista de mis items que quiero mostrar en mi ListView
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista
        ..add(tempWidget)
        ..add(Divider(
          color: Colors.purple,
        ));
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    //  var widgets = opciones.map((item) {
    return opciones.map((item) {
      // puede ser cualquier nombre que se le quiera dar, aqui se eligio item
      return Column(
        children: <Widget>[  // ctrl .  wrap column
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier cosa'),
            // el leading es un widget que se coloca al inicio y el trailing es un widget que se coloca al final
            leading: Icon(Icons
                .account_circle_rounded), //https://material.io/resources/icons/?style=baseline
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
    //  return widgets;
  }
}
