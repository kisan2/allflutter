import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function reciver;
  final String answer;

  Answer(this.reciver,this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(1),
      child: ButtonTheme(
        minWidth: 40,
        height: 50,


        child: RaisedButton(
          onPressed: reciver,


          child: Text(answer),
          color: Colors.blue,
          textColor: Colors.white,
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
