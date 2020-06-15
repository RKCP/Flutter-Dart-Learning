import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  List<Color> colors = [
    Colors.red[600],
    Colors.yellow,
    Colors.pink[200],
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.blue
  ];

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
                createButton(colors[0], 1),
                createButton(colors[1], 2),
                createButton(colors[2], 3),
                createButton(colors[3], 4),
                createButton(colors[4], 5),
                createButton(colors[5], 6),
                createButton(colors[6], 7),
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

Expanded createButton(Color color, int note) {
  return Expanded(
    child: FlatButton(
      color: color,
      onPressed: () {
        changeNote(note);
      },
    ),
  );
}
