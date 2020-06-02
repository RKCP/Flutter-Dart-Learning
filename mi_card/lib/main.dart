import 'package:flutter/material.dart';
import 'package:micard/custom_icons_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 75,
              backgroundColor: Colors.grey[800],
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
            SizedBox(
              height: 30,
              width: 170,
              child: Divider(
                color: Colors.grey[100],
              ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(50, 5, 50, 30),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.grey[800],
                ),
                title: Text(
                  'rkcpeters@gmail.com',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 20,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                dense: true,
                onTap: () {
                  emailURL();
                },
              ),
            ),
            Card(
                margin: EdgeInsets.fromLTRB(50, 0, 50, 30),
                child: ListTile(
                  leading: Icon(CustomIcons.github, color: Colors.grey[800]),
                  title: Text(
                    'github.com/RKCP',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  dense: true,
                  onTap: () {
                    githubURL();
                  },
                )),
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

emailURL() async {
  const url = 'mailto:rkcpeters@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Connection failed.';
  }
}

githubURL() async {
  const url = 'https://github.com/RKCP';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Connection failed.';
  }
}
