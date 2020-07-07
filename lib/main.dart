import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'navbar.dart';
import 'auth/auth.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

final FirebaseAuth auth = FirebaseAuth.instance;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'GO',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                hintColor: Color(0xFFC0F0E8),
                primaryColor: Color(0xFF80E1D1),
                fontFamily: "Montserrat",
                canvasColor: Colors.transparent),
            home: new StreamBuilder(
              stream: auth.onAuthStateChanged,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return NavBar();
                }
                return LoginRegister();
              },
            ),
            routes: <String, WidgetBuilder>{
              '/home': (BuildContext context) => new NavBar(),
              '/login': (BuildContext context) => new LoginRegister()
            },
    );
  }
}