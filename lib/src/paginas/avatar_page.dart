import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: <Widget>[
            
            Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://scontent.ftgu2-2.fna.fbcdn.net/v/t1.0-9/147543571_3823851671006497_4975022787507044224_o.jpg?_nc_cat=108&ccb=2&_nc_sid=730e14&_nc_ohc=qJ9LeXFvygIAX9tTPz0&_nc_ht=scontent.ftgu2-2.fna&oh=2ac4cf57f06d32bdbcb249b08e87a226&oe=6045B936'),
                radius: 25.0,
              ),
            ),
            
            Container(   // ctrl . wrap with container
              margin: EdgeInsets.only(right:10.0),
              child: CircleAvatar(

                 child: Text('SL'),
                 backgroundColor: Colors.brown,
              ),
            )
          ],
        ),
        body: Center(
          child: FadeInImage(
            image: NetworkImage('https://scontent.ftgu2-2.fna.fbcdn.net/v/t1.0-9/89036148_2905681856156821_7346096906138812416_o.jpg?_nc_cat=100&ccb=2&_nc_sid=174925&_nc_ohc=UEm67kterwsAX9GKypo&_nc_ht=scontent.ftgu2-2.fna&oh=125eaa5fa37e9a3ca561b4d62f427de4&oe=60435FC2'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
          ),
        ),
    );
  }
}