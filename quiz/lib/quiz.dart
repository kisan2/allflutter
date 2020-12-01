import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
    {@required this.question,
    @required this.questionIndex,
    @required this.answerQuestion

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questions(question[questionIndex]['question']),
        Row(
          children: [
            ...(question[questionIndex]['answer'] as List<Map<String,Object>>)
                .map((answer) {
              return Answer(()=>answerQuestion(answer['score']), answer['text']);
            }).toList()
          ],
        ),
      ],
    );
  }
}
