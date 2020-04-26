// import 'dart:async';
import 'dart:ui';
// import './data/mockData.dart';
import 'package:datacolletionv1/pages/signUp.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
// import 'package:bubble/bubble.dart';

class Home extends StatefulWidget {
 
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  Widget build(BuildContext context) {
   // var p =MaterialPageRoute(builder: (context)=>SignUp());
  //  print("");
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.teal,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 10,
          child: Image.asset(
            "images/logo.png",
          ),
        ),
      ),
      title: Text('Translate'),
      actions: <Widget>[
        Center(
            child: Text(
          "Request",
        )),
        IconButton(
            icon: Icon(Icons.payment),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()))),
        IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()))),
      ],
    ),
    // backgroundColor: Colors.black54,
    );
  }
}
 