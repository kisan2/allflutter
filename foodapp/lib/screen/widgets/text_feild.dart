import 'package:flutter/material.dart';

class textForm extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscuretext;
  final TextEditingController controller;

  textForm({@required this.hintText, this.icon, @required this.obscuretext,
  @required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext,
      controller: controller,
      style: TextStyle(color: Colors.white),
      //keyboardAppearance:TextInputType.texttype,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(icon),
          onPressed: () {},
          color: Colors.white,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
