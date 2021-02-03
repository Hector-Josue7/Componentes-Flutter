// se utiliza el snippet mateapp para construir la interfaz basica del main.dart
import 'package:flutter/material.dart';
import 'package:componentes/src/paginas/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Componentes App',
        debugShowCheckedModeBanner: false,
        home: HomePageTemp());
  }
}
