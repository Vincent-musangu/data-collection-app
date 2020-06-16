// import 'package:datacolletionv1/pages/signUp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';

// class EnglishTranslation extends StatefulWidget {
//   @override
//   _EnglishTranslation createState() => _EnglishTranslation();
// }

// class _EnglishTranslation extends State<EnglishTranslation> {
//   SignUp inputs = new SignUp();
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: FutureBuilder(
//           future: null,
//           builder: (context, snapshot) => ListView.separated(
//               itemCount: 14,
//               separatorBuilder: (BuildContext context, int index) => Divider(
//                     thickness: 0.5,
//                   ),
//               itemBuilder: (BuildContext context, int index) => ListTile(
//                     onTap: () {
//                       TextEditingController translationController =
//                           TextEditingController();
//                       showDialog(
//                           builder: (contxt) => AlertDialog(
//                                   actions: <Widget>[
//                                     GestureDetector(
//                                       onTap: ()=>{},
//                                       child:Text('Cancel')
//                                     ), GestureDetector(
//                                       onTap: ()=>{},
//                                       child:Text('Send')
//                                     )
//                                   ],
//                                   content: inputs.fields(
//                                       translationController,
//                                       'give your tonga translation',
//                                       TextInputType.text,
//                                       false,
//                                       false),
//                                   title: Text(
//                                       "english:some day things will be fine the pandemic will end")),
//                           context: context);

//                       ;
//                     },
//                     // selected: true,
//                     leading: CircleAvatar(
//                         child: Icon(AntDesign.message1,
//                             size: 30, color: Colors.white),
//                         backgroundColor:
//                             Colors.black.withBlue(70).withGreen(38),
//                         radius: 30),
//                     trailing: Text("12:45hrs "),
//                     // isThreeLine: true,
//                     title: Text("pending"),
//                     subtitle: Text(
//                         "english:some day things will be fine the pandemic will end"),
//                   )),
//         ),
//       ),
//     );
//   }
// }
