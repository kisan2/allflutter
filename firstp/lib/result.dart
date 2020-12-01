import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int result;
  final Function resetQuiz;

  Result(this.result,this.resetQuiz);
  String get resultPhrase {
    var resultText;
    if (result >= 30) {
      resultText = 'full score';
    } else if (result >= 20) {
      resultText = 'second bestt';
    } else if (result >= 10) {
      resultText = 'u atleast score something';
    } else {
      resultText = 'zero';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(115.0),
      padding: EdgeInsets.only(top: 0,right: 10),
        child: Column(
      children: [
        Text(
          resultPhrase,
          style: TextStyle(
            fontSize: 28,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          onPressed: resetQuiz,
          child: Text('Restart Quiz'),
          color: Colors.blue,
        )
      ],
    ));
  }
}
