import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQestion;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQestion,
      @required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['question'],
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String,Object>>)
        .map((answer) {
          return Answer(()=>answerQestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
