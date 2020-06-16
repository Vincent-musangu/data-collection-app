import 'package:chat_list/chat_list.dart';
import 'package:datacolletionv1/pages/Login.dart';
import 'package:datacolletionv1/pages/chatRoom.dart';
import 'package:datacolletionv1/pages/signUp.dart';
// import 'package:datacolletionv1/pages/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home>  {
 var storage = new FlutterSecureStorage();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: Drawer(
            child: ListView(children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Text(
              'Vision AI',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            )),
            decoration: BoxDecoration(
              color: Colors.black.withBlue(70).withGreen(38),
            ),
          ),
          ListTile(
            leading: Icon(Octicons.sign_in, size: 40),
            onTap: () => {
              // storage.delete,
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()))},
            title: Text('Logout'),
          ),
          ListTile(
            leading: Icon(AntDesign.adduser, size: 40),
            onTap: () => {
  // storage.delete,
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUp()))},
            title: Text('Signup'),
          ),
          ListTile(
            leading: Icon(Octicons.file, size: 40),
            title: Text('Policies'),
            onTap: ()=>{},
          ),
          ListTile(
            leading: Icon(
              Entypo.bug,
              size: 40,
            ),
            onTap: () => {},
            title: Text('report bug'),
          )
        ])),
        appBar: AppBar(
         
            backgroundColor: Colors.black.withBlue(70).withGreen(38),
            title: Text('Translate'),
            ),
        body:ChatRoom()
        );
  }
}
