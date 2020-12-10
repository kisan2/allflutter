import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:momo/screen/homepage.dart';
import 'package:momo/screen/welcomePage.dart';
import 'package:momo/screen/loginPage.dart';
import 'package:momo/screen/signuppage.dart';
import 'package:momo/screen/signuppagee.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: LoginPage(),
      /*home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (index, snapshot) {
            if (snapshot.hasData) {
              return HomePage();
             // return LoginPage();
            }
            return LoginPage();
          }),*/
      title: 'momo app',
    );
  }
}
