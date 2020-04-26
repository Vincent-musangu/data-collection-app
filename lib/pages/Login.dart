import 'package:datacolletionv1/pages/HomePage.dart';
import 'package:datacolletionv1/pages/signUp.dart';
import 'package:datacolletionv1/pages/welcome.dart';
import 'package:datacolletionv1/services/httpServices.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_svg/flutter_svg.dart';
class Login extends StatefulWidget {
// SgnUp(Key:Key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ///input controllers used to get values from inputfields
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var _resp ='';

  // input fields
  DataSent incoming = new DataSent();
  SignUp inputField = new SignUp();
  
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
                  'Login',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withBlue(60).withGreen(14)),
                )),
            // Login Fileds Starts here

            inputField.fields(this.phoneController, 'phone number',
                TextInputType.text, false),
            inputField.fields(
                this.passwordController, 'password', TextInputType.text, true),
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

                  var status = await incoming.login(phone, password);

                  print(status);
                  if (status == 201 ||status == 200) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Welcome()));
                  } else if (status == 404) {
                    setState(() {
                      _resp = "no user found";
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
