import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/screen/login_page.dart';
import 'package:foodapp/screen/widgets/text_feild.dart';
import 'package:foodapp/screen/widgets/button.dart';

class SignUpPage extends StatefulWidget {
  /* int btn() {
    loginPage();
  }*/
  static Pattern pattern = r'^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool loading = false;
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
      setState(() {
        loading = false;
      });
    }
     setState(() {
        loading = false;
      });
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
      setState(() {
        loading = true;
      });
      sendDate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.black,

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
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textForm(
                        controller: firstName,
                        obscuretext: false,
                        hintText: 'firstName',
                        icon: null,
                      ),
                      textForm(
                        controller: lastName,
                        obscuretext: false,
                        hintText: 'lastName',
                        icon: null,
                      ),
                      textForm(
                        controller: email,
                        obscuretext: false,
                        hintText: 'Email',
                        icon: null,
                      ),
                      textForm(
                        controller: password,
                        obscuretext: true,
                        hintText: 'Password',
                        icon: Icons.security,
                      ),
                      textForm(
                        controller: null,
                        obscuretext: true,
                        hintText: 'ConfirmPassword',
                        icon: Icons.security,
                      ),
                    ],
                  ),
                ),
               loading?Row(
                 mainAxisAlignment:MainAxisAlignment.center,
                 children: [
                   CircularProgressIndicator(),
                   
                 ],
               ):Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                      btn: () {},
                      btnName: 'Cancel',
                      color: Colors.grey[600],
                      height: 45,
                      width: 150,
                      textcolor: Colors.white,
                      //btn: btn,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Button(
                        btn: () {
                          validation();
                        },
                        btnName: 'Register',
                        //: btn,
                        color: Colors.red[900],
                        height: 45,
                        width: 150,
                        textcolor: Colors.white),
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
