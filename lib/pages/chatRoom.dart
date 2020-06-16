import 'package:chat_list/chat_list.dart';
import 'package:datacolletionv1/pages/signUp.dart';
import 'package:datacolletionv1/services/httpServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoom createState() => _ChatRoom();
}

class _ChatRoom extends State<ChatRoom> {
  TextEditingController chatController = TextEditingController();

  SignUp inputs = new SignUp();
  DataSent allPhrases = new DataSent();
  phraseset() {
    return allPhrases.incoming();
  }

  var _counter = 0;
  final List<MessageWidget> _messageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: phraseset(),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              var reqdata = snapshot.data['phrases'];

              print(reqdata[_counter]['phrase']);
              print(reqdata[_counter]['Id']);
              return Stack(
                fit: StackFit.loose,
                overflow: Overflow.clip,
                children: <Widget>[
                  Padding(
                    child: ChatList(
                      children: _messageList,
                      scrollController: ScrollController(
                          // initialScrollOffset: 4.4,
                          ),
                    ),
                    padding: EdgeInsets.only(bottom: 50),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                        top: (MediaQuery.of(context).size.height - 145),
                      ),
                      child: Container(
                        child: Stack(children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                right: 76, bottom: 8, left: 8, top: 13),
                            child: inputs.fields(
                                this.chatController,
                                'enter your translation',
                                TextInputType.text,
                                false,
                                false,
                                IconButton(
                                    icon: Icon(Icons.send),
                                    onPressed: () async {
                                      var values = await allPhrases.outgoing(
                                          chatController.text.toString(),
                                          reqdata[_counter]['Id']);
                                      print('status is $values');
                                      if (values == 200 || values == 201) {
                                        setState(() {
                                          _messageList.add(MessageWidget(
                                              content: chatController.text
                                                  .toString(),
                                              ownerType: OwnerType.sender,
                                              ownerName: "vincent"));
                                        });

                                        // var values = await allPhrases.incoming();
                                        // print(values[12]['phrase']);
                                        Future.delayed(
                                            Duration(seconds: 2),
                                            () => setState(() {
                                                  _counter++;
                                                  _messageList.add(
                                                      MessageWidget(
                                                          content:
                                                              reqdata[_counter]
                                                                  ['phrase'],
                                                          ownerType: OwnerType
                                                              .receiver,
                                                          ownerName: "robot"));
                                                }));
                                      }
                                      // print(chatController.text.toString());
                                    })),
                          ),
                          Positioned(
                              // top: 0,
                              right: 10,
                              child: FloatingActionButton(
                                  child: Text('New'),
                                  backgroundColor: Colors.blueGrey,
                                  onPressed: () async {
                                    var values = await allPhrases.incoming();

                                    Future.delayed(
                                        Duration(seconds: 2),
                                        () => {
                                              setState(() {
                                                _messageList.add(MessageWidget(
                                                    content: reqdata[++_counter]
                                                        ['phrase'],
                                                    ownerType:
                                                        OwnerType.receiver,
                                                    ownerName: "robot"));
                                              }),
                                              print(values[_counter]['phrase']),
                                              print(_counter)
                                            });
                                  }))
                        ]),
                      ))
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
