import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHadeler;
  final String answerText;
  Answer(this.selectHadeler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      child: RaisedButton(
        color: Colors.red,
        textColor: Colors.white,
        child: Text(answerText),
        onPressed: selectHadeler,
      ),
    );
  }
}
