import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:momo/screen/buttondsn.dart';
import 'package:momo/screen/teextfieldF.dart';

class LoginPage extends StatefulWidget {
  static Pattern pattern = r'^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  UserCredential userCredential;
  RegExp regExp = RegExp(LoginPage.pattern);
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

 Future loginAuth() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      // await FirebaseFirestore.instance.collection('userData').get({});
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        globalKey.currentState.showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for that user.'),
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
  }

  void validation() {
    if (email.text.trim().isEmpty ||
        email.text.trim() == null && password.text.trim().isEmpty ||
        password.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('Email and password is empty')));
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('Email is empty')));
      return;
    } else if (!regExp.hasMatch(email.text)) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('invalid email address')));
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('password is empty')));
      return;
    } else {
      setState(() {
        loading = true;
      });
      loginAuth();
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),

        /* decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('asset/images/logo.png'),
            fit: BoxFit.cover,
        ),),*/

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: 160),
              child: Text(
                'log In',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  TextfieldF(
                    controller: email,
                    obscuretext: false,
                    labelText: 'Email',
                    icon: Icons.person_outline,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextfieldF(
                    controller: password,
                    obscuretext: true,
                    labelText: 'Password',
                    icon: Icons.lock_outline,
                  ),
                ],
              ),
            ),
            loading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : Container(
                    child: Buttondsn(
                      name: 'Log In',
                      btn: () {
                        validation();
                      },
                      color: Colors.red,
                      textColor: Colors.white,
                      size: 200,
                      bordercolor: Colors.red,
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New user?',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Text(
                  'Register Now',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
