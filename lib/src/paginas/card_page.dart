import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        children: <Widget>[
          //este es el arreglo de cada uno de los elementos que va a estar dentro de ese ListView, va a tener un largo estatico, por eso se crea con el ListView normal y no con el Builder
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
           SizedBox(height: 30.0),
 
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
           SizedBox(height: 30.0),

            _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
           SizedBox(height: 30.0),

            _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
           SizedBox(height: 30.0),

        ],
        padding: EdgeInsets.all(10.0),

        // padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
      ),
    );
  }

  Widget _cardTipo1() {
    // irse a la documentacion de flutter y buscar el card class
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              20.0)), // buscar ShapeBorder en la documentacion de flutter
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_library, color: Colors.blue),
          title: Text('Soy el titulo de esta tarjeta'),
          subtitle: Text(
              'Aqui esta una idea del ejemplo que quiero mostrarles usando un texto largo para esta tarjeta, es dificil aprender flutter pero la practica hace al maestro, estudiandolo constantemente lograremos grandes cosas, muchos exitos'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment
              .end, // el mainaxisalignment alinea los botones a la derecha
          children: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: () {},
            ),
            FlatButton(
              child: Text('Ok'),
              onPressed: () {},
            )
          ],
        )
      ]),
    );
  }

  Widget _cardTipo2() {
    //  final card = Card(
    final card = Container(
      //clipBehavior: Clip.antiAlias,  // nos ayuda a que lo que esta en la tarjeta no se salga del contenido de la misma
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://www.diffusionsport.com/wp-content/uploads/2017/08/adidas-balones-futbol-champions-league-785x487.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover, // esto es para adaptar la imagen dependiendo del contenedor que le estamos asignando
          ),
          /* 
         Image(
            image: NetworkImage(
                'https://i.pinimg.com/originals/bb/e6/ef/bbe6ef6407006bcce3fd3a4c083d9429.jpg'),
          ),
         */

          Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  'No tengo idea de que escribir')) // ctrl . -> wrap with container
        ],
      ),
    );

    return Container( //un container es como un div html, por defecto es igual al ancho y alto que tenga su contenido
     
      decoration: BoxDecoration(  // propiedades del contenedor 
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white, // contenido del contenedor, es un contenedor que parece tarjeta
      boxShadow: <BoxShadow> [
       BoxShadow(
         color: Colors.black26,
          blurRadius: 10.0,
          spreadRadius: 2.0,   // que tanto se extienda esto
          offset: Offset(2.0, 10.0)  // determinar la posicion de la sombra
       )
      ]
      ),
       child: ClipRRect( // contenedor mismo, ClipRRect nos va a permitir cortar cualquier cosa que se encuentre fuera de ese contenedor
       borderRadius: BorderRadius.circular(30.0),
       child: card,
       ),  
    );
  }
}
