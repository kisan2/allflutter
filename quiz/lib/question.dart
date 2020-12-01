import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String question;
  Questions(this.question);
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      padding: const EdgeInsets.all(4),

      child: Text(question,
      textAlign:TextAlign.center,
      style: TextStyle(
      fontSize:30,
      fontWeight:FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontFamily: 'Roboto'
      
      ),
      ),
      
    );
  }
}
