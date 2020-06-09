import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  void rollDice() {
    setState(() {
      leftDiceNum = Random().nextInt(6) + 1;
      rightDiceNum = Random().nextInt(6) + 1;
      // need this inside setState.
      // When the dice is pressed, we want to update the build and setState does this.
      // image won't update without this. setState triggers a rebuild,
      // and changes what needs to change, aka our image asset.
      // setState sets changed things as dirty, and on hot reload,
      // changes things that use the changed variable etc
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceNum.png'),
              onPressed: () {
                rollDice();
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$rightDiceNum.png'),
              onPressed: () {
                rollDice();
              },
            ),
          ),
        ],
      ),
    );
  }
}
