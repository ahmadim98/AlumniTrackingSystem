import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alumniapp/const.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'destination.dart';
import 'chat_backend.dart';

class chat extends StatefulWidget {
  const chat({ Key key, this.destination ,@required this.chatt,@required this.studentID,@required this.feedbackID,@required this.feedbackTitle}) : super(key: key);
  final Destination destination;
  final List<Chat> chatt;
  final int studentID;
  final int feedbackID;
  final String feedbackTitle;
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  final TextEditingController textEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
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
              itemCount: widget.chatt.length,//here where u can change the list !!
              itemBuilder: (BuildContext context, int index) {
                //this._answers.add("");
                if(widget.chatt[index].FeedbackID == widget.feedbackID){
                  if(widget.chatt[index].From == widget.studentID.toString()){
                    return Container(
                      child: Text(
                        widget.chatt[index].Message,
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
                        widget.chatt[index].Message,
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
          Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.image),
                onPressed: () {},
                color: primaryColor,
              ),
            ),
            color: Colors.white,
          ),

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