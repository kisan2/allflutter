import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextfieldF extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final bool obscuretext;
  final TextEditingController controller;

  TextfieldF({@required this.labelText, this.icon,
  this.controller,this.obscuretext});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //keyboardType: TextInputType.emailAddress,
      obscureText:obscuretext ,
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey),

          //hintText:
          //hintstyle:
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(30))),
    );
  }
}
