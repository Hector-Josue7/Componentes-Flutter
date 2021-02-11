import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  // List<int> _listaNumeros = [1, 2, 3, 4, 5];
  ScrollController _scrollController =
      new ScrollController(); // controlador del scroll de la lista
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super
        .initState(); // este super hace referencia a la clase state y la inicializa (ListaPageState)
    _agregar10();
    // esto se va a disparar cada vez que se mueva el scroll

    _scrollController.addListener(() {
      // print('SCROLL!!!');
      // si la posicion en pixeles es exactamente igual al scrollcontroller
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // si la posicion es de 1000 pixeles y el scroll maximo es de 1000 pixeles, quiere decir que estamo al final de la pagina
        //_agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // este codigo se dispara cuando la pagina deja de existir en la pila de paginas

    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        body: Stack(
          children: <Widget>[_crearLista(), _crearLoading()],
        ));
  }

  Widget _crearLista() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros
          .length, // cuantos elementos tiene esta lista en este preciso instante
      itemBuilder: (BuildContext context, int index) {
        // Builder es la forma como se va a dibujar ese elemento o widget,
        final imagen = _listaNumeros[index];

        return FadeInImage(
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }

  void _agregar10() {
    // cada vez que llame a este metodo va a agregar 10 imagenes a la lista

    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return new Timer(duration,
        respuestaHTTP); // cuando pasen los dos segundos quiero disparar el metodo respuestaHTTP
  }

  void respuestaHTTP() {
    _isLoading =
        false; // si ya pasaron 2 segundos quiere decir que ya termine de cargar

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn,
         duration: Duration(milliseconds: 250)
        );

    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
