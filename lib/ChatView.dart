import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Destination.dart';
import 'ChatController.dart';

final themeColor = Color(0xfff5a623);
final primaryColor = Colors.blue;
final greyColor = Color(0xffaeaeae);
final greyColor2 = Color(0xffE8E8E8);

class ChatRoom extends StatefulWidget {
  const ChatRoom({ Key key, this.destination ,@required this.chatt,@required this.studentID,@required this.feedbackID,@required this.feedbackTitle}) : super(key: key);
  final Destination destination;
  final List<Chat> chatt;
  final int studentID;
  final int feedbackID;
  final String feedbackTitle;
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController textEditingController = new TextEditingController();
  List<Chat> chatt;

  @override
  Widget build(BuildContext context) {
    chatt = widget.chatt;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(widget.feedbackTitle),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          new Expanded(
            child: new ListView.builder(
              itemCount: chatt.length,//here where u can change the list !!
              itemBuilder: (BuildContext context, int index) {
                //this._answers.add("");
                if(chatt[index].FeedbackID == widget.feedbackID){
                  if(chatt[index].From == widget.studentID.toString()){
                    return Container(
                      child: Text(
                        chatt[index].Message,
                        style: TextStyle(color: Colors.black),
                      ),
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      width: 200.0,
                      decoration: BoxDecoration(color: Colors.lightBlue[400],
                          borderRadius: BorderRadius.circular(8.0)),
                      margin: EdgeInsets.only(bottom: 20.0, right: 10.0),
                    );
                  }else {
                    return Container(
                      child: Text(
                        chatt[index].Message,
                        style: TextStyle(color: Colors.white),
                      ),
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                      width: 200.0,
                      decoration: BoxDecoration(
                          color: greyColor, borderRadius: BorderRadius.circular(8.0)),
                      margin: EdgeInsets.only(bottom: 20.0, left: 10.0),
                    );
                  }
                }return Container();
              },
            ),
          ),
          ],
      ),
      bottomSheet: buildInput(),
    );
  }

  Widget buildInput() {
    return Container(
      child: Row(
        children: <Widget>[
          // Button send image
          /*Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.image),
                onPressed: () {},
                color: primaryColor,
              ),
            ),
            color: Colors.white,
          ),*/

          // Edit text
          Flexible(
            child: Container(
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: greyColor),
                ),
                // focusNode: focusNode,
              ),
            ),
          ),

          // Button send message
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 8.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () {
                  setState(() {
                    print(textEditingController.text);
                    Chat ch = new Chat(-1,widget.feedbackID,widget.studentID.toString(),"1",textEditingController.text);
                    ch.sendChat(widget.feedbackID);
                    textEditingController.clear();// Clear the Text area
                    chatt.add(ch);
                    (context as Element).reassemble();
                  });
                },
                color: primaryColor,
              ),
            ),
            color: Colors.white,
          ),
        ],
      ),
      width: double.infinity,
      height: 50.0,
      decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: greyColor2, width: 0.5)),
          color: Colors.white),
    );
  }
}