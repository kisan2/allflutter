import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';
import 'package:quiz/result.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final _question = [
    {
      'question': 'what is flutter?',
      'answer': [
        {'text':'native', 'score': 0},
        {'text':'hybride','score': 10},
        {'text':'web based', 'score': 0},
        {'text':'none', 'score': 0}
      ],
    },
    {
      'question': 'what language does flutter use?',
      'answer': [
        {'text':'jave', 'score': 0},
        {'text':'c#', 'score': 0},
        {'text':'dart','score': 10},
        {'text':'javascript', 'score': 0}
      ],
    },
  ];

  var _questionIndex = 0;
  var _answerin = 0;

  void _rest() {
    setState(() {
      _questionIndex = 0;
      _answerin = 0;
    });
  }

  void _answerQuestion(int score) {
    _answerin += score;
    setState(() {
      _questionIndex += 1;
      
    });
    if (_questionIndex < _question.length) {
      print('sorry more on the way');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('QUIZ'),
        ),
        body: _questionIndex < _question.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                question: _question,
                questionIndex: _questionIndex,
              )
            : Result(_answerin, _rest),
      ),
    );
  }
}
