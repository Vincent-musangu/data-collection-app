// // import 'dart:async';
// // import 'dart:ui';
// // import './data/mockData.dart';
// import 'package:datacolletionv1/pages/signUp.dart';
// import 'package:flutter/material.dart';

// // import 'Login.dart';
// // import 'package:bubble/bubble.dart';

// class TranslatedPhrases extends StatefulWidget {
//   @override
//   _TranslatedPhrases createState() => _TranslatedPhrases();
// }

// class _TranslatedPhrases extends State<TranslatedPhrases> {
//   SignUp inputs = new SignUp();
//   Widget build(BuildContext context) {
//     // var p =MaterialPageRoute(builder: (context)=>SignUp());
//     //  print("");
//     return Scaffold(
//       body: Container(
//         child: FutureBuilder(
//           future: null,
//           builder: (context, snapshot) => ListView.separated(
//             itemCount: 14,
//             separatorBuilder: (BuildContext context, int index) => Divider(
//               thickness: 0.5,
//             ),
//             itemBuilder: (BuildContext context, int index) => GestureDetector(

//                 onDoubleTap: () {
//                   TextEditingController translationController =
//                       TextEditingController();

//                   var listField;
//                   listField = inputs.fields(translationController,
//                       'enter your translation', TextInputType.text, false,true);
//                   return listField;
//                 },
//                 child: ListTile(
//                   // leading: CircleAvatar(
//                   //   backgroundColor:Colors.tealAccent,
//                   //   radius:10
//                   // ),
//                   // trailing:Text ("12hrs "),
//                   isThreeLine: true,
//                   subtitle: Text(
//                       "tonga:some day things will be fine the pandemic will end and we shoul resume our normal bussiness operations in zamba a prophet by vincent musangu"),
//                   title: Text(
//                       "english:some day things will be fine the pandemic will end and we shoul resume our normal bussiness operations in zamba a prophet by vincent musangu"),
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }
