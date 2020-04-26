import 'package:datacolletionv1/pages/signUp.dart';
import 'package:flutter/material.dart';
class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.teal,
      child:Center(child:
      GestureDetector(
        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp())),
        child: Text("welcome"),),
      )
       
    );
  }

}