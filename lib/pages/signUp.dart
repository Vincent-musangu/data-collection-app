import 'package:datacolletionv1/main.dart';
// import 'package:datacolletionv1/pages/welcome.dart';
import 'package:datacolletionv1/services/httpServices.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

// import 'Login.dart';

class SignUp extends StatefulWidget {
  Widget fields(controllerName, hint, inputKeyBoardType, textType, focus,iconic) =>
      Container(
        // color: Colors.white,
        // height: 35,
  
        child: TextFormField(
     
          autofocus: focus,
          obscureText: textType,
          controller: controllerName,
          decoration: InputDecoration(
            fillColor: Colors.white,
          suffixIcon:iconic,
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
  var _resp = ' ';
  // print(_resp);
  // input fields
  DataSent incoming = new DataSent();

  @override
  Widget build(BuildContext context) => Material(
        // color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(70, 70, 70, 0),
          child: ListView(children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.person_pin,
                  size: 60,
                  color: const Color(0xff000990),
                )),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withBlue(70).withGreen(38)),
                )),
            // sign Up Fileds Starts here

            Padding(
           padding: const EdgeInsets.only(top:20.0),
              child: widget.fields(this.firstNameameController, 'first Name',
                  TextInputType.text, false, false,null),
            ),
            // Text(
            //   'kwa george',
            //   style: TextStyle(color: Colors.red),
            // ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: widget.fields(this.lastNameController, 'last Name',
                  TextInputType.text, false, false,null),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: widget.fields(this.phoneNumberController, 'phone number',
                  TextInputType.phone, false, false,null),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: widget.fields(this.passwordController, 'password',
                  TextInputType.visiblePassword, true, false,null),
            ),
            //login button below here
            Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
              child: FlatButton(
                splashColor: Colors.blueGrey,
                color: Colors.black.withBlue(70).withGreen(38),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Sign UP',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  var firstName = this.firstNameameController.text;
                  var lastName = this.lastNameController.text;
                  var phone = this.phoneNumberController.text;
                  var password = this.passwordController.text;
                  var status = await incoming.signup(
                      firstName, lastName, phone, password);
                  if (phone.length < 10 || phone.length > 10) {
                    print("password cannot have less than 10 digits");
                  }
                  if (password.length < 8) {
                    print("password cannot be less than 8 charectors");
                  }

                  // print(status);
                  if (status == 400) {
                    print("user duplicate");
                    // setState(() {
                    //   _resp = "user already exist";
                    // });
                  }
                  if (status == 201 || status == 200) {
               var newStatus=await incoming.login(phone, password);
                    print('tologin $newStatus');
                    if (newStatus['statusCode'] == 200 ||
                        newStatus['statusCode'] == 201) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    }
                  } else {
                    print(
                        'an error occured please make sure you have internet connection');
                  }
                },
              ),
            ),
            Text('$_resp'),

             Row(
                children: <Widget>[
                  Text(
                    "Already have an account ? ",
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login())),
                    child: Text(
                      " Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ),
                ],
              ),
            
          ]),
        ),
      );
}
