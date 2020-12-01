import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetQuiz;

  Result(this.score, this.resetQuiz);

  String get resultphrase {
    var resultText;
    if (score >= 20) {
      resultText = "good job";
      print(score);
    } else if (score >= 10) {
      resultText = "satisfactory job";
       print(score);
    } else {
      resultText = "bad job";
       print(score);
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(115.0),
      padding: EdgeInsets.only(top: 0, right: 10),
      child: Column(
        children: [
          Text(
            resultphrase,
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
      ),
    );
  }
}
