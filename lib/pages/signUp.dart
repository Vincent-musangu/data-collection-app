import 'package:datacolletionv1/pages/HomePage.dart';
import 'package:datacolletionv1/pages/welcome.dart';
import 'package:datacolletionv1/services/httpServices.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

// import 'package:flutter_svg/flutter_svg.dart';
class SignUp extends StatefulWidget {
// SgnUp(Key:Key);
  Widget fields(controllerName, hint, inputKeyBoardType, textType) => Container(
        height: 55,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(10),
        child: TextFormField(
          obscureText: textType,
          controller: controllerName,
          decoration: InputDecoration(
            // fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(14, 0, 8, 5),
            hintText: hint,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          keyboardType: inputKeyBoardType,
        ),
      );

  @override
  _State createState() => _State();
}

class _State extends State<SignUp> {
  ///input controllers used to get values from inputfields
  TextEditingController firstNameameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var _resp=' ';
  // print(_resp);
  // input fields
  DataSent incoming = new DataSent();

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.greenAccent,
        child: Padding(
          padding: EdgeInsets.fromLTRB(70, 70, 70, 0),
          child: ListView(children: <Widget>[
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
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withBlue(60).withGreen(14)),
                )),
            // sign Up Fileds Starts here

            widget.fields(this.firstNameameController, 'first Name',
                TextInputType.text, false),
                Text('kwa george',style: TextStyle(color:Colors.red),),
            widget.fields(this.lastNameController, 'last Name',
                TextInputType.text, false),
            widget.fields(this.phoneNumberController, 'phone number',
                TextInputType.phone, false),
            widget.fields(this.passwordController, 'password',
                TextInputType.visiblePassword, true),
            //login button below here
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
              child: FlatButton(
                splashColor: Colors.blueGrey,
                color: Colors.black.withBlue(40).withGreen(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Sign UP',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  var fistName = this.firstNameameController.text;
                  var lastName = this.lastNameController.text;
                  var phone = this.phoneNumberController.text;
                  var password = this.passwordController.text;
                  var status = await incoming.signup(
                      fistName, lastName, phone, password);

                  // print(status);
                  if (status == 201 || status == 200) {
                    var newStatus = await incoming.login(
                         phone, password);
                         print('tologin $newStatus'); 
                         if (newStatus== 200) {
                           
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                         }

                  } else if (status == 400) {
                    setState(() {
                      _resp = "user already exist";
                    });
                  }
                },
              ),
            ),
            Text('$_resp'),

            Text(
              "Already have an account ? Login",
              textAlign: TextAlign.center,
            )
          ]),
        ),
      );
}
