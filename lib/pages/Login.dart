import 'dart:ui';

import 'package:datacolletionv1/main.dart';
import 'package:datacolletionv1/pages/HomePage.dart';
import 'package:datacolletionv1/pages/Tabs.dart';
import 'package:datacolletionv1/pages/signUp.dart';
import 'package:datacolletionv1/services/httpServices.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ///input controllers used to get values from inputfields
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _resp;



  // input fields
  DataSent incoming = new DataSent();
  SignUp inputField = new SignUp();

  //  var errorMsg=()=>{

  //               return
  //  };

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: MediaQuery.of(context).size.height/5),
          child: Column(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.person_pin,
                    size: 60,
                    color: Colors.black.withBlue(70).withGreen(35),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withBlue(60).withGreen(14)),
                  )),

              if (_resp == true)
                Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.all(3),
                    child: Text(
                      'invlid email password combination',
                      style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )),

              // Login Fileds Starts here
              
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child:inputField.fields(this.phoneController, 'phone number',
                  TextInputType.text, false, false,null),
                  ),
                  Padding(padding:EdgeInsets.only(top:20),
                  child: inputField.fields(this.passwordController, 'password',
                  TextInputType.text, true, false,null),),
              
              //login button below here
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                child: FlatButton(
                  splashColor: Colors.blueGrey,
                  color: Colors.black.withBlue(40).withGreen(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    var phone = this.phoneController.text;
                    var password = this.passwordController.text;

                    var jwt = await incoming.login(phone, password);
                    // print(jwt);

                    if (jwt['statusCode'] == 200 || jwt['statusCode'] == 201 ) {
                      var storage = new FlutterSecureStorage();
                      // var userCredentials = {
                        
                      //   "firstName": '${jwt['bodyMassege']['firstName']}',
                      //   "lastName": '${jwt['bodyMassege']['lstName']}',
                      //   "phoneNumber": '${jwt['bodyMassege']['phoneNumber']}',
                      //   "accessToken": jwt['bodyMassege']['accessToken'],
                      //   "refreshToken": jwt['bodyMassege']['phoneNumber'],
                      // };
                      var token=jwt['bodyMassege']['accessToken']; 
                      // Map accessToken={

                      // }
  print( token);
                      storage.write(key: 'jwt', value: jwt['bodyMassege']['accessToken']);
                  // storage.write(key: 'jwt', value: jwt['bodyMassege']['firstName']);

                    //  print(access);
                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    }
                    if (jwt['statusCode'] == 401 || jwt['statusCode'] == 404) {
                      setState(() {
                        _resp = true;
                      });
                    }
                  },
                ),
              ),
              // Text('$_resp'),
               Padding(
                 padding:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/6.0),
                 child: Row(
                    children: <Widget>[
                      Text(
                        "don't have an account ? ",
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp())),
                        child: Text(
                          " Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.lightBlueAccent),
                        ),
                      ),
                    ],
                  ),
               ),
              
            ]),
        ),
        
      );
}
