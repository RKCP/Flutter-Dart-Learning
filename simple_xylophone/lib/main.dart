import 'package:audioplayers/audioplayers.dart';
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

///Audio player state handler to get rid of the 'Callback lookup failed!' error onSoundComplete
void audioPlayerHandler(AudioPlayerState value) {
  print('The AudioPlayerState value is $value');
}

/// Method to change the note file to whatever button is pressed.
void changeNote(int buttonPressed) {
  AudioPlayer audioPlayer = new AudioPlayer();
  audioPlayer.monitorNotificationStateChanges(audioPlayerHandler);
  AudioCache audioCache = AudioCache();
  audioCache.play('note$buttonPressed.wav');
}
