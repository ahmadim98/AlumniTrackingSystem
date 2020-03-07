import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alumniapp/const.dart';

class chat extends StatefulWidget {
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


        title: Text('Abdulrhman'),
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
          Container(
            child: Text(
              'Good Morning',
              style: TextStyle(color: Colors.black),
            ),
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            width: 200.0,
            decoration: BoxDecoration(color: Colors.lightBlue[400],
                borderRadius: BorderRadius.circular(8.0)),
            margin: EdgeInsets.only(bottom: 20.0, right: 10.0),
          ),
          Container(
            child: Text(
              'Hi',
              style: TextStyle(color: Colors.white),
            ),
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            width: 200.0,
            decoration: BoxDecoration(
                color: greyColor, borderRadius: BorderRadius.circular(8.0)),
            margin: EdgeInsets.only(bottom: 20.0, left: 10.0),
          ),
          Container(
            child: Text(
              'How are you',
              style: TextStyle(color: Colors.black),
            ),
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            width: 200.0,
            decoration: BoxDecoration(color: Colors.lightBlue[400],
                borderRadius: BorderRadius.circular(8.0)),
            margin: EdgeInsets.only(bottom: 20.0, right: 10.0),
          ),
          Container(
            child: Text(
              'I am fine, you?',
              style: TextStyle(color: Colors.white),
            ),
            padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
            width: 200.0,
            decoration: BoxDecoration(
                color: greyColor, borderRadius: BorderRadius.circular(8.0)),
            margin: EdgeInsets.only(bottom: 20.0, left: 10.0),
          ),
        ],
      ),

      /*Center(
        child: Column(
          children: <Widget>[
            Text(
                'Hello',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[100],
                    ),

            ),
            SizedBox(height: 6,),
            Text(
              'Hi',
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlue[400]
              ),
            ),
          ],
        ),
      )*/
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
          /*Material(
            child: new Container(
              margin: new EdgeInsets.symmetric(horizontal: 1.0),
              child: new IconButton(
                icon: new Icon(Icons.face),
                onPressed: getSticker,
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
                onPressed: () {},
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