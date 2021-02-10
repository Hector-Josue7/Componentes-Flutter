// se utiliza el snippet mateapp para construir la interfaz basica del main.dart

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/paginas/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
//import 'package:componentes/src/paginas/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                                       ],
      supportedLocales: [
                const Locale('en', ''), // English, no country code
                const Locale('es', 'ES'),
                    ],

      //  home: HomePage());
      initialRoute: '/',
      routes:
          getAplicationRoutes(), // cuando la ruta no esta definida en este grupo se dispara el onGenerateRoute

      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llamada: ${settings.name}');

        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
