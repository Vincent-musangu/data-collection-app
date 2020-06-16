// import 'package:datacolletionv1/pages/Login.dart';
// import 'package:datacolletionv1/pages/signUp.dart';
// // import 'package:datacolletionv1/pages/signUp.dart';
// import 'package:flutter/material.dart';
// import './first.dart' as first;
// import './second.dart' as second;
// import './third.dart' as third;
// import 'package:flutter_icons/flutter_icons.dart';

// void main() {
//   runApp(new MaterialApp(home: new MyTabs()));
// }

// class MyTabs extends StatefulWidget {
//   @override
//   MyTabsState createState() => new MyTabsState();
// }

// class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
//   TabController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = new TabController(vsync: this, length: 3);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         drawer: Drawer(
//             child: ListView(children: <Widget>[
//           DrawerHeader(
//             child: Center(
//                 child: Text(
//               'Vision AI',
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                   color: Colors.white),
//             )),
//             decoration: BoxDecoration(
//               color: Colors.black.withBlue(70).withGreen(38),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Octicons.sign_in, size: 40),
//             onTap: () => Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Login())),
//             title: Text('Logout'),
//           ),
//           ListTile(
//             leading: Icon(AntDesign.adduser, size: 40),
//             onTap: () => Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => SignUp())),
//             title: Text('Signup'),
//           ),
//           ListTile(
//             leading: Icon(Octicons.file, size: 40),
//             title: Text('Policies'),
//             onTap: ()=>{},
//           ),
//           ListTile(
//             leading: Icon(
//               Entypo.bug,
//               size: 40,
//             ),
//             onTap: () => {},
//             title: Text('report bug'),
//           )
//         ])),
//         appBar: AppBar(
//             backgroundColor: Colors.black.withBlue(70).withGreen(38),
//             title: Text('Translate'),
//             bottom: new TabBar(controller: controller, tabs: <Tab>[
//               new Tab(
//                 text: "phrases",
//               ),
//               new Tab(text: "traslated"),
//               new Tab(
//                 text: "payments",
//               )
//             ])),
//         body: new TabBarView(controller: controller, children: <Widget>[
//           new first.EnglishTranslation(),
//           new second.TranslatedPhrases(),
//           new third.Third()
//         ]));
//   }
// }
