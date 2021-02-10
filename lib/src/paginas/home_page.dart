import 'package:flutter/material.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [], // este parametro no es más que la información que va a tener por defecto, mientras no se ha resuelto ese future, es obligarorio, sino saldra
     // un error que dice The method forEach was called on null
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        //  print('builder');
        //  print(snapshot.data);

        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );

    //  print(menuProvider.opciones);
// Buscar el FutureBuilder en la documentación de flutter
    /*menuProvider.cargarData().then((opciones) {
      print('_lista');
      print(opciones);
    }); 
   
    */
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];


    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.green[600],
        ),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          // final route = MaterialPageRoute(
          //    builder: (context) => AlertPage()
          //  );
          //    Navigator.push(context, route); // para colocar encima otra pantalla, el context lo necesita para saber en que punto esta crendo esa pagina
        }, // nos va a servir para hacer la navegacion, o sea al darle click
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
    /* return [
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo')),
      Divider(),
      ListTile(title: Text('Hola Mundo')),
      Divider(),
    ];*/
  }
}
