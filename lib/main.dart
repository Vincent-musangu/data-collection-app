// import 'dart:async';
// import 'dart:ui';
// import './data/mockData.dart';
import 'package:datacolletionv1/pages/HomePage.dart';
import 'package:datacolletionv1/pages/Login.dart';
import 'package:flutter/material.dart';
// import 'package:bubble/bubble.dart';

import 'pages/signUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const TITLE = 'Translate';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TITLE,
      theme: ThemeData(
        // primaryColorLight: Colors.greenAccent,
        accentColor: Colors.greenAccent,
        primarySwatch: Colors.teal,
      ),
      home: Home(),
    );
  }
}
