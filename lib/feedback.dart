import 'dart:async';
import 'package:flutter/material.dart';
import 'destination.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _FeedbackPage createState() => _FeedbackPage();
}

class _FeedbackPage extends State<FeedbackPage> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: '${widget.destination.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.title),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: widget.destination.color[30],

      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[ TextField(controller: _textController),
          ]
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}