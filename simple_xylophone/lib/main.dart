import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

///field variable as I do not want to build this list every time it is used.
List<Color> colors = [
  Colors.red[600],
  Colors.yellow,
  Colors.pink[200],
  Colors.green,
  Colors.purple,
  Colors.orange,
  Colors.blue
];

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
                children: createWidgets(7)),
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

/// Creates the buttons on the xylophone.
Expanded createButton(int number) {
  return Expanded(
    child: FlatButton(
      color: colors[number],
      onPressed: () {
        changeNote(number);
      },
    ),
  );
}

/// Can't put for loops inside widgets, so have to create the buttons here
/// and add them to a list of widgets that build the xylophone.
List<Widget> createWidgets(int numberOfWidgets) {
  List<Widget> widgets =
      List(); // cannot give it a fixed number of widgets to add. Must be growable otherwise throws an error.

  for (int i = 0; i < numberOfWidgets; i++) {
    widgets.add(createButton(i));
  }

  return widgets;
}
