import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(), // para poner los bordes redondeados del boton
          onPressed: () => _mostrarAlert(
              context), // cpmo quiero mandar el context como argumento, entonces por eso debo usar la funcion de flecha
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.rotate_90_degrees_ccw_sharp),
        onPressed: () {
          Navigator.pop(context); // con esta linea retorna a la pagina anterior
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true, // para cerrar la alerta haciendo click afuera
        builder: (context) {
          // funcion encargada de crear el dialog o el popopsito de la alerta
          return AlertDialog(
            // crear la configuracion de lo que se va a mostrar nuestro dialogo
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
          ),

            title: Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize
                  .min, // para que se adapte al contenido que tiene interno, que el contenido interno diga que tan ancho es
              children: <Widget>[
                Text('Este es el contenido de la caja de la alerta'),
                FlutterLogo(size: 100.0)
              ],
            ),
            actions: <Widget>[
              // botones por defecto
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
