import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(EightBallPage());
}

class EightBallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text(
            'Ask Me Anything',
            style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 20,
              letterSpacing: 2,
            ),
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: EightBall(),
      ),
    );
  }
}

class EightBall extends StatefulWidget {
  @override
  _EightBallState createState() => _EightBallState();
}

class _EightBallState extends State<EightBall> {
  int imageNumber = 1;

  void changeNumber() {
    setState(() {
      imageNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          child: Image.asset('images/ball$imageNumber.png'),
          onPressed: () {
            changeNumber();
          },
        ),
      ),
    );
  }
}
