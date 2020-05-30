import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buchalka Boys"),
          backgroundColor: Colors.purple[900],
        ),
        backgroundColor: Colors.purple[50],
        body: Center(
          child: Image(
              image: AssetImage('images/buchalka.png'),
              width: 400,
              height: 400,
              fit: BoxFit.fitWidth),
        ),
      ),
    ),
  );
}
