import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      margin: EdgeInsets.all(10) ,
      color:Colors.blue[100],
      padding: const EdgeInsets.all(14),

      child:Text(
      questionText,
      style: TextStyle(
        fontSize: 28,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        
      ),
      textAlign:TextAlign.center,
      
     ),
    // transform: Matrix4.rotationZ(0.9),
    );
  }
}
