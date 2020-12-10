import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:foodapp/screen/welcome_page.dart';
import 'package:foodapp/screen/login_page.dart';
import 'package:foodapp/screen/sign_up.dart';
import 'package:foodapp/screen/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //useful to change check mood to make it faster
      debugShowCheckedModeBanner: false,

      title: 'Food App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff2b2b2b),
        appBarTheme: AppBarTheme(color: Color(0xff2b2b2b)
        )
          // primaryColor: Colors.blue,
          //accentColor: Colors.blue,
          //textSelectionColor: Colors.red
          ),

      //home: HomePage(),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (index, sncpshot) {
            if (sncpshot.hasData) {
              return HomePage();
            }
            return loginPage();
          }),
    );
  }
}
