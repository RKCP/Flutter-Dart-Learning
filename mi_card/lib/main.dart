import 'package:flutter/material.dart';
import 'package:micard/custom_icons_icons.dart';

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
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Padding(
                padding: EdgeInsets.all(10.0),
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
                      'rkcpeters@gmail.com',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(50, 0, 50, 30),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Icon(CustomIcons.github, color: Colors.grey[800]),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'https://github.com/RKCP',
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(CustomIcons.java, color: Colors.white),
                  Icon(CustomIcons.iconfinder_flutter_4691465,
                      color: Colors.white),
                  Icon(CustomIcons.sql_file_symbol, color: Colors.white),
                  Icon(CustomIcons.html5, color: Colors.white),
                  Icon(CustomIcons.css3_alt, color: Colors.white),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
