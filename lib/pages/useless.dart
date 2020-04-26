
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   ScrollController _controller=ScrollController();
//   var newData = DataReceived(); 
//   @override
//   Widget build(BuildContext context) {
//     Timer(Duration(milliseconds: 1000), () => _controller.jumpTo(_controller.position.maxScrollExtent));
//     double pixelRatio = MediaQuery.of(context).devicePixelRatio;
//     double px = 1 / pixelRatio;

//     BubbleStyle styleSomebody = BubbleStyle(
//       nip: BubbleNip.leftTop,
//       radius: Radius.circular(2),
//       color: Colors.white,
//       elevation: 1 * px,
//       margin: BubbleEdges.only(top: 8.0, right: 50.0),
//       alignment: Alignment.topLeft,
//     );
//     BubbleStyle styleMe = BubbleStyle(
//       radius: Radius.circular(2),
//       nip: BubbleNip.rightTop,
//       color: Colors.grey,
//       elevation: 1 * px,
//       margin: BubbleEdges.only(top: 8.0, left: 50.0),
//       alignment: Alignment.topRight,
//     );

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black.withBlue(45).withGreen(14),
//         leading: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             backgroundColor: Colors.white,
//             radius: 10,
//             child: Image.asset(
//               "images/logo.png",
//             ),
//           ),
//         ),
//         title: Text('${MyApp.TITLE} '),
//         actions: <Widget>[
//           Center(
//               child: Text(
//             "Request",
//           )),
//           IconButton(icon: Icon(Icons.payment), onPressed: () => {}),
//           IconButton(icon: Icon(Icons.menu), onPressed: () => {}),
//         ],
//       ),
//       body: Stack(children: <Widget>[
//         Container(
//           color: Colors.grey.withAlpha(30),
//           child: FutureBuilder(
//             // future: newData.incoming(),
//             builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//               if (snapshot.hasData) {
//                 var data = snapshot.data;
//                 var bubleType;

//                 return Container(
//                   child: ListView.builder(
//                     itemCount: data.length,
//                   controller: _controller,
//                     padding: EdgeInsets.fromLTRB(8,8,8,60),
//                     itemBuilder: (BuildContext context, int index) {
//                       if (data[index]['from'] == 'user') {
//                         bubleType = styleMe;
//                       } else {
//                         bubleType = styleSomebody;
//                       }
//                       return Bubble(
//                         style: bubleType,
//                         child: Column(
//                           children: <Widget>[
//                             Text('${data[index]['massage']}'),
//                             // Text('${data[index]['time']}',textAlign: TextAlign.right,),
//                             // Text("Traslate",textAlign: TextAlign.end,)
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               }
//               return CircularProgressIndicator(
//                 backgroundColor: Colors.deepOrange,
//               );
//             },
//           ),
//         ),
//         Positioned(
//           left: 0,
//           right: 0,
//           bottom: 0,
//           child: Container(
//             // margin: ,

//             height: 60,
//             padding: EdgeInsets.fromLTRB(14, 10, 14, 5),
//             color: Color.fromRGBO(239, 238, 238, 1),

//             child: TextFormField(
//               enableInteractiveSelection: true,
//               decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 contentPadding: EdgeInsets.fromLTRB(14, 0, 8, 5),
//                 // isDense: false,
//                 suffixIcon: IconButton(icon: Icon(Icons.send), onPressed: null),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(30)),
//                   borderSide: BorderSide(color:Colors.white38)
//                 ),
//               ),
//               expands: true,
//               minLines: null,
//               maxLines: null,
//               keyboardType: TextInputType.multiline,
//               initialValue: "hello",
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }


// for 