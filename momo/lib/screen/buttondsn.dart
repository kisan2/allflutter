import 'package:flutter/material.dart';

class Buttondsn extends StatelessWidget {
  final String name;
  final Color color;
  final Color textColor;
  final double size;
  final Color bordercolor;
  final Function btn;

  Buttondsn(
      {@required this.name,
      this.color,
      this.textColor,
      this.size,
      this.btn,
      this.bordercolor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: 45,
      child: RaisedButton(
        onPressed: btn,
        color: color,
        child: Text(
          name,
          style: TextStyle(
            color: textColor,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: bordercolor, width: 1)),
      ),
    );
  }
}
