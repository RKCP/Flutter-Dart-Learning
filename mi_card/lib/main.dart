import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
            child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage('images/avatar.png'),
            ),
            Text(
              'Raphael Peters',
              style: TextStyle(
                fontFamily: 'RockSalt',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 2,
              ),
            ),
            Text('SOFTWARE DEVELOPER',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  color: Colors.grey[100],
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                )),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[800],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "rkcpeters@gmail.com",
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.grey[900],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.add_a_photo),
                  Icon(Icons.add_alarm),
                  Icon(Icons.add_alarm),
                  Icon(Icons.add_alarm),
                  Icon(Icons.add_alarm),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.add_a_photo),
                  Icon(Icons.add_alarm),
                  Icon(Icons.add_alarm),
                  Icon(Icons.add_alarm),
                  Icon(Icons.add_alarm),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
