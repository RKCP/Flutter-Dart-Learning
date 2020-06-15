import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    color: Colors.red[600],
                    onPressed: () {
                      changeNote(1);
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    color: Colors.yellow,
                    onPressed: () {
                      changeNote(2);
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    color: Colors.pink[200],
                    onPressed: () {
                      changeNote(3);
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      changeNote(4);
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    color: Colors.purple,
                    onPressed: () {
                      changeNote(5);
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    color: Colors.orange,
                    onPressed: () {
                      changeNote(6);
                    },
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      changeNote(7);
                    },
                  ),
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
