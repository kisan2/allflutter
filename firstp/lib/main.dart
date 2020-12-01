import 'package:firstp/quiz.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

//void main() {
//runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'question': 'whats you age?',
      'answer': [
        {'text': '21', 'score': 10},
        {'text': '22', 'score': 0},
        {'text': '25', 'score': 0},
        {'text': '40', 'score': 0}
      ],
    },
    {
      'question': 'where are you from?',
      'answer': [
        {'text': ' nepal', 'score': 10},
        {'text': 'china', 'score': 0},
        {'text': 'usa', 'score': 0},
        {'text': 'austrila', 'score': 0}
      ],
    },
    {
      'question': 'which game do u play?',
      'answer': [
        {'text': ' pubg', 'score': 0},
        {'text': 'coc', 'score': 10},
        {'text': 'cr', 'score': 0},
        {'text': 'ML', 'score': 0}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQestion(int score) {
    //var aBool =true ;
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    if (_questionIndex < _questions.length) {
      print('sorry more on the way');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQestion: _answerQestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  } //build
} //class
