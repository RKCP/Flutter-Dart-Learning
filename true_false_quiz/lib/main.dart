import 'package:flutter/material.dart';

void main() => runApp(TFQuiz());

class TFQuiz extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Score keeping
  List<Icon> scores = [];

  // Questions
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];

  // Answers
  List<bool> answers = [
    false,
    true,
    true,
  ];

  // could use a HashMap for these, but for the purpose of this exercise, using Lists (Arrays) for learning.
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5, // make this take up the most space in the column
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[counter],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (answers[counter] == true) {
                  setState(() {
                    scores.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  setState(() {
                    scores.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                if (counter + 1 >= questions.length) {
                  counter = 0;
                } else {
                  counter++;
                }

                print(counter);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (answers[counter] == false) {
                  setState(() {
                    scores.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  setState(() {
                    scores.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                if (counter + 1 >= questions.length) {
                  counter = 0;
                } else {
                  counter++;
                }
                print(counter);
              }, // must be present or the buttons color will be set to the default disabledColor property.
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: scores,
          ),
        ),
      ],
    );
  }
}
