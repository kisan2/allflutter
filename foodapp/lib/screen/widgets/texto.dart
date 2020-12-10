import 'package:flutter/material.dart';

class textFormO extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscuretext;
  final TextEditingController controller;

  textFormO({@required this.hintText, this.icon, @required this.obscuretext,
  @required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext,
      controller: controller,
      style: TextStyle(color: Colors.white),
      //keyboardAppearance:TextInputType.texttype,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xff3a3e3e),
        prefixIcon: IconButton(
          icon: Icon(icon),
          onPressed: () {},
          color: Colors.white,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
