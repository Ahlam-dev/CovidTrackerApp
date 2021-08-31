import 'package:flutter/material.dart';

import 'mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Covid tracker ',
        theme: ThemeData(
            textTheme: TextTheme(
                headline1: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                bodyText1: TextStyle(color: Colors.white70, fontSize: 16,letterSpacing: 0.4),
                bodyText2: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold))),
        home: mainScreen());
  }
}
