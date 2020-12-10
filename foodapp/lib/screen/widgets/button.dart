import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final String btnName;
  final Color color;
  final Color textcolor;
  final double fntsize;
  final Function btn;

  Button(
      {@required this.width,
      @required this.height,
      @required this.btnName,
      @required this.color,
      @required this.textcolor,
      this.fntsize,
      this.btn
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: RaisedButton(
        onPressed: btn,
        color: color,
        child: Text(
          btnName,
          style: TextStyle(color: textcolor, fontSize: fntsize),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          //side: BorderSide(color: Colors.green,
          //width: 2)
        ),
      ),
    );
  }
}
