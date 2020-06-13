import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                FlatButton(
                  color: Colors.red,
                  onPressed: () {
                    changeNote(1);
                  },
                ),
                FlatButton(
                  color: Colors.yellow,
                  onPressed: () {
                    changeNote(2);
                  },
                ),
                FlatButton(
                  color: Colors.pink,
                  onPressed: () {
                    changeNote(3);
                  },
                ),
                FlatButton(
                  color: Colors.green,
                  onPressed: () {
                    changeNote(4);
                  },
                ),
                FlatButton(
                  color: Colors.purple,
                  onPressed: () {
                    changeNote(5);
                  },
                ),
                FlatButton(
                  color: Colors.orange,
                  onPressed: () {
                    changeNote(6);
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    changeNote(7);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void changeNote(int buttonPressed) {
  final player = AudioCache();
  player.play('note$buttonPressed.wav');
}
