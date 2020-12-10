import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:momo/screen/buttondsn.dart';
import 'package:momo/screen/teextfieldF.dart';

class SignUPage extends StatefulWidget {
  static Pattern pattern = r'^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$';
  @override
  _SignUPageState createState() => _SignUPageState();
}

class _SignUPageState extends State<SignUPage> {
  UserCredential userCredential;
  RegExp regExp = RegExp(SignUPage.pattern);
  TextEditingController firstname = TextEditingController();

  TextEditingController lastname = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  Future sendDate() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      await FirebaseFirestore.instance
        ..collection('userDate').doc(userCredential.user.uid).set({
          'firstname': firstname.text.trim(),
          'lastname': lastname.text.trim(),
          'email': email.text.trim(),
          'password': password.text.trim(),
        });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey.currentState.showSnackBar(
            SnackBar(content: Text('The password provided is too weak.')));
      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState.showSnackBar(SnackBar(
            content: Text('The account already exists for that email.')));
      }
    } catch (e) {
      globalKey.currentState.showSnackBar(SnackBar(content: Text(e)));
    }
  }

  void valadition() {
    if (firstname.text.trim().isEmpty || firstname.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('"first Name is empty"')));
      return;
    }
    if (lastname.text.trim().isEmpty || lastname.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('"Last Name is empty"')));
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('"email is empty"')));
      return;
    } else if (!regExp.hasMatch(email.text)) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text('email invalid '),
        ),
      );
      return;
    }

    if (password.text.trim().isEmpty || password.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('"password is empty"')));
      return;
    } else {
      sendDate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 50),
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'signUp',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextfieldF(
                          controller: firstname,
                          obscuretext: false,
                          labelText: 'FirstName',
                          icon: null,
                        ),
                        TextfieldF(
                          controller: lastname,
                          obscuretext: false,
                          labelText: 'LastName',
                          icon: null,
                        ),
                        TextfieldF(
                          controller: email,
                          obscuretext: false,
                          labelText: 'email',
                          icon: null,
                        ),
                        TextfieldF(
                            controller: password,
                            obscuretext: true,
                            labelText: 'PassWord',
                            icon: null),
                        TextfieldF(
                          labelText: 'confirmPassword',
                          obscuretext: true,
                          controller: null,
                          icon: null,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Buttondsn(
                        name: 'Cancel',
                        bordercolor: Colors.grey,
                        color: Colors.grey,
                        size: 150,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Buttondsn(
                        name: 'Register',
                        btn: () {
                          valadition();
                        },
                        bordercolor: Colors.red,
                        color: Colors.red,
                        size: 150,
                        textColor: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
