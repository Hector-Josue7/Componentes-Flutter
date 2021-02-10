// esto va a ser un stateFullWidget porque necesito manejar el estado del slider

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (valor) {
        // es un metodo que va a recibir el valor que tenga ese slider
        setState(() {
          _valorSlider = valor;
        });
        // print(valor);
      },
    );
  }

  Widget _checkBox() {
    return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor) {
        _bloquearCheck = valor; // bloquearCheck va a ser igual al valor que estoy recibiendo del checkBox
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      //   image: NetworkImage('https://i.pinimg.com/originals/9a/14/b3/9a14b316790cde17b6f01989426af0e1.jpg'),

      image: NetworkImage(
          'https://scontent.ftgu2-2.fna.fbcdn.net/v/t1.0-9/69467763_2509970295727981_2868914493029613568_o.jpg?_nc_cat=108&ccb=3&_nc_sid=19026a&_nc_ohc=8EnxrzuzC00AX_xoTVz&_nc_ht=scontent.ftgu2-2.fna&oh=d427aa09b0111b8a16502c3e2a253bce&oe=60474A40'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
