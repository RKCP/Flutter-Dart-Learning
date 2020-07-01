import 'package:flutter/material.dart';
import 'package:truefalsequiz/QuizHelper.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  QuizHelper quizHelper = new QuizHelper();

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizHelper.getAnswer();

    setState(() {
      if (quizHelper.isFinished()) {
        // Alert user
        Alert(
          context: context,
          title: 'Quiz Completed!',
          desc: 'You have completed the quiz!',
          buttons: [
            DialogButton(
              child: Text(
                "RESTART",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        // reset the quiz
        quizHelper.resetQuiz();

        // reset the scores
        scores = [];
      } else {
        if (userAnswer == correctAnswer) {
          scores.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scores.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizHelper.nextQuestion();
      }
    });
  }

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
                quizHelper.getQuestion(),
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
                checkAnswer(true);
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
                checkAnswer(false);
              }, // must be present or the buttons color will be set to the default disabledColor property.
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Row(
              children: scores,
            ),
          ),
        ),
      ],
    );
  }
}
