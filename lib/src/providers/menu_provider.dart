// para leer ese archivo JSON necesito un paquete propio que viene en flutter
import 'package:flutter/services.dart'
    show rootBundle; // el rootBundle tiene lo que necesito para leer ese JSON
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    //  print(dataMap['rutas']);
    opciones = dataMap['rutas'];
    return opciones;
  }

  /* rootBundle.loadString('data/menu_opts.json').then((data) {
    print(data);
  }); */
}

final menuProvider = new _MenuProvider();
