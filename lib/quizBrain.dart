import 'package:flutter/material.dart';
import 'package:quiz_application/Question.dart';
import 'package:rich_alert/rich_alert.dart';

class quizBrain {
  int _questionNumber = 0;

  List<Question> _Questions = [
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

  String getQuestion() {
    return _Questions[_questionNumber].question;
  }

  bool getCorrectAnswer() {
    return _Questions[_questionNumber].answer;
  }

  void nextQuestion(BuildContext context, Function quizAgain) {
    if (_questionNumber < _Questions.length - 1)
      _questionNumber++;
    else
      endQuiz(context, quizAgain);
  }

  bool isInRange() {
    if (_questionNumber < _Questions.length - 1)
      return true;
    else
      return false;
  }

  setNum(int num) {
    _questionNumber = num;
  }

  endQuiz(BuildContext context, Function quizAgain) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return RichAlertDialog(
            //uses the custom alert dialog
            alertTitle: richTitle("QUIZ ENDED"),
            alertSubtitle: richSubtitle(
                "You have completed all the questions successfully."),
            alertType: RichAlertType.SUCCESS,
            actions: [
              RaisedButton(
                child: Text('TAKE QUIZ AGAIN'),
                color: Colors.teal,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: quizAgain,
              ),
            ],
          );
        });
  }
}
