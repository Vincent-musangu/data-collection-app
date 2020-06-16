// import 'dart:async';
// import 'dart:ui';
// import './data/mockData.dart';
import 'package:datacolletionv1/pages/HomePage.dart';
// import 'package:datacolletionv1/pages/HomePage.dart';
// import 'package:datacolletionv1/pages/Tabs.dart';
// import 'pages/Login.dart';
import 'package:flutter/material.dart';
// import 'package:bubble/bubble.dart';

// import 'pages/signUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const TITLE = 'Translate';
  @override
  // MaterialColor xd= Colors.black.withBlue(70).withGreen(38);
  Widget build(BuildContext context) {
      var daata={
'sex':'M',
'other':{
'name':'vincent'
}
  };
// var newset=Parse
    return MaterialApp(
      title: TITLE,
      theme: ThemeData(
        // primaryColorLight: Colors.greenAccent,
        accentColor: Colors.black.withBlue(70).withGreen(38),
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
