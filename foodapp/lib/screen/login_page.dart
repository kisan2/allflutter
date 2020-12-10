import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodapp/screen/widgets/text_feild.dart';
import 'package:foodapp/screen/widgets/button.dart';

class loginPage extends StatefulWidget {
  
 static Pattern pattern = r'^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$';
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  bool loading = false;
  UserCredential userCredential;
  RegExp regExp=RegExp(loginPage.pattern);
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
    if(email.text.trim().isEmpty || email.text.trim() == null&&password.text.trim().isEmpty || password.text.trim() == null){
        globalKey.currentState
          .showSnackBar(SnackBar(content:
           Text('Email and password is empty')));
      return;

    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      globalKey.currentState
          .showSnackBar(SnackBar(content: Text('Email is empty')));
      return;
    }else if(!regExp.hasMatch(email.text)){
      globalKey.currentState
          .showSnackBar(SnackBar(
            content: Text('invalid email address')));
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
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: globalKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 140),
                child: Text(
                  'Log In',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  textForm(
                    controller: email,
                    obscuretext: false,
                    hintText: 'Email',
                    icon: Icons.person_outline,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  textForm(
                    controller: password,
                    obscuretext: true,
                    hintText: 'Password',
                    icon: Icons.security,
                  ),
                ],
              ),
//button

              loading?Row(
                mainAxisAlignment: MainAxisAlignment.center,

              children: [
                CircularProgressIndicator(),

              ],):Container(
                child: Button(
                  btn: () {
                    validation();
                  },
                  btnName: 'Log In',
                  color: Colors.red[900],
                  height: 45,
                  width: 200,
                  textcolor: Colors.white,
                  fntsize: 20,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New user?',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Text(
                    'Register Now',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
