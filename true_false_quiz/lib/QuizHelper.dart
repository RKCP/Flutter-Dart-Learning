import 'Question.dart';

class QuizHelper {
  int _counter = 0;

  List<Question> listOfQuestions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion() {
    if (_counter < listOfQuestions.length - 1) {
      _counter++;
    }
  }

  String getQuestion() {
    return listOfQuestions[_counter].questionText;
  }

  bool getAnswer() {
    return listOfQuestions[_counter].questionAnswer;
  }

  /// This is a method that checks to see if we are at the end of the quiz.
  bool isFinished() {
    if (this._counter >= listOfQuestions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  /// This is a method that resets the quiz to the start upon completion
  void resetQuiz() {
    listOfQuestions.shuffle();
    this._counter = 0;
  }
}
