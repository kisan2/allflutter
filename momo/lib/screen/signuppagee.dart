import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momo/screen/loginpage.dart';
import 'package:momo/screen/teextfieldF.dart';
import 'package:momo/screen/buttondsn.dart';

class SignUpPage extends StatefulWidget {
  /* int btn() {
    loginPage();
  }*/
  static Pattern pattern = r'^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  UserCredential userCredential;
  RegExp regExp = RegExp(SignUpPage.pattern);
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
//for firebase
  Future sendDate() async {
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);

      await FirebaseFirestore.instance
        ..collection('userData').doc(userCredential.user.uid).set({
          'firstName': firstName.text.trim(),
          'lastName': lastName.text.trim(),
          'email': email.text.trim(),
          'userid': userCredential.user.uid,
          'password': password.text.trim(),
        });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text('The account already exists for that email.'),
          ),
        );
      }
    } catch (e) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(e),
        ),
      );
    }
  }

  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        //lightweight message with an optional action which briefly displays at the bottom of the screen
        SnackBar(
          content: Text("first Name is empty"),
        ),
      );
      return;
    }
    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Lastname is empty'),
        ),
      );
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text('email is empty'),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text)) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text('invalid is empty'),
        ),
      );
      return;
    }

    if (password.text.trim().isEmpty || password.text.trim() == null) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Lastname is empty'),
        ),
      );
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

//A widget that insets its child by sufficient padding to avoid intrusions by the operating system.

//For example, this will indent the child by enough to avoid the status bar at the top of the screen.
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          child: Container(
            margin: EdgeInsets.only(right: 10, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'SignUp',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  height: 350,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextfieldF(
                        controller: firstName,
                        obscuretext: false,
                        labelText: 'firstName',

                        icon: null,
                      ),
                       TextfieldF(
                        controller: lastName,
                        obscuretext: false,
                        
                        labelText:'lastName' ,
                        icon: null,
                      ),
                       TextfieldF(
                        controller: email,
                        obscuretext: false,
                        labelText: 'Email',
                        icon: null,
                      ),
                       TextfieldF(
                        controller: password,
                        obscuretext: true,
                        labelText:  'Password',
                        icon: Icons.security,
                      ),
                       TextfieldF(
                        controller: null,
                        obscuretext: true,
                        labelText:  'ConfirmPassword',
                        icon: Icons.security,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                          validation();
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
      ),
    );
  }
}
