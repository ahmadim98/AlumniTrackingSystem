import 'dart:async';
import 'package:flutter/material.dart';
import 'destination.dart';

class showSurvey extends StatefulWidget {
  const showSurvey({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _showSurvey createState() => _showSurvey();
}

class _showSurvey extends State<showSurvey> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: ${widget.destination.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<int> shades = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.title),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: shades.length,//here where u can change the list !!
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(

              height: 200,
              child: Card(
                //margin: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                color: Colors.white,
                child: InkWell(
                  /*onTap: () {
                    Navigator.pushNamed(context, "/feedback");
                  },*/
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[ Text('Question $index : ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28,),),
                      new Row(children:[new Radio(value: 0,groupValue: -1,onChanged: (val) {setState(() {});},), new Text("Answer 1"),]),
                      new Row(children:[new Radio(value: 0,groupValue: -1,onChanged: (val) {setState(() {});},), new Text("Answer 2"),]),
                      new Row(children:[new Radio(value: 0,groupValue: -1,onChanged: (val) {setState(() {});},), new Text("Answer 3"),]),
                    ],

                  ),

                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}