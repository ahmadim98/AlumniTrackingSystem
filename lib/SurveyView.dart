import 'dart:async';
import 'package:flutter/material.dart';
import 'Destination.dart';

import 'SurveyController.dart';

class showSurvey extends StatefulWidget {
  const showSurvey({ Key key, this.destination , @required this.surveyy,@required this.studentID}) : super(key: key);

  final Destination destination;
  final Survey surveyy;
  final int studentID;

  @override
  _showSurvey createState() => _showSurvey();
}

class _showSurvey extends State<showSurvey> {
  TextEditingController _textController;
  _showSurvey(){}

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: ${widget.destination.title}',
    );
  }

  String _answer = "";
  int length = 0;
  List<String> _answers = new List(5);
  List<Answer> answersToDB = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.title),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child:new Column(
          children: <Widget>[
        new Expanded(
          child: new ListView.builder(
          itemCount: widget.surveyy.Questions.length,//here where u can change the list !!
          itemBuilder: (BuildContext context, int index) {
            //this._answers.add("");

            return SizedBox(

              height: 200,
              child: Card(
                //margin: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 1,horizontal: 10),
                color: Colors.white,
                child: InkWell(
                  /*onTap: () {
                    Navigator.pushNamed(context, "/feedback");
                  },*/
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[ Text('Question $index : '+ widget.surveyy.Questions[index].QuestionTitle , style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28,),),
                      new Row(children:[new Radio(value: widget.surveyy.Questions[index].Options[0],groupValue: _answers[index],onChanged: (val) {setState(() {_answers[index] = val;});},), new Text(widget.surveyy.Questions[index].Options[0]),]),
                      new Row(children:[new Radio(value: widget.surveyy.Questions[index].Options[1],groupValue: _answers[index],onChanged: (val) {setState(() {_answers[index] = val;});},), new Text(widget.surveyy.Questions[index].Options[1]),]),
                      new Row(children:[new Radio(value: widget.surveyy.Questions[index].Options[2],groupValue: _answers[index],onChanged: (val) {setState(() {_answers[index] = val;});},), new Text(widget.surveyy.Questions[index].Options[2]),]),
                    ],

                  ),

                ),

              ),

            );
          },
        ),
        ),
            const SizedBox(height: 5),
            RaisedButton(
              onPressed: () {
                int counter = 1;
                for(var col in this._answers){
                  Answer answer = new Answer(widget.surveyy.ID,counter,widget.studentID,col);
                  answer.SubmitAnswers();
                  counter++;
                }
                Timer timer = new Timer(new Duration(seconds: 3), () {
                  Navigator.pop(context);
                });
              },
              child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20)
              ),
            ),
          ],),
      ),

    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}