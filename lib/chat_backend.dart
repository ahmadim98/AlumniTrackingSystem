import 'package:alumniapp/CONDBINFO.dart';
import 'package:alumniapp/main.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';

class feedback {
  int ID;
  int GraduateID;
  String title;

  feedback(int id,int graduateid,String title){
    this.ID = id;
    this.GraduateID = graduateid;
    this.title = title;
  }
}

class retrieveFeedbackList {
  List<feedback> feedbacks;

  retrieveFeedbackList(int graduateID){
    feedbacks = new List();
    Future main() async{
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH, port: DBP, user: DBU, password: DBPAS, db: DBN));
      // Query the database using a parameterized query
      var results = await conn
          .query('SELECT `ID`, `GraduateID`, `title` FROM `feedback` WHERE GraduateID=?', [graduateID]);

      for (var col in results) {
        feedback fd = new feedback(col[0], col[1], col[2]);
        this.feedbacks.add(fd);
      }
      await conn.close();
    }
    print(this.feedbacks.length);
    main();
  }

}

class insertNewFeedback{
  insertNewFeedback(String title){
    Future main() async{
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH, port: DBP, user: DBU, password: DBPAS, db: DBN));
      // Query the database using a parameterized query
      var results = await conn
          .query('INSERT INTO `feedback` (`ID`, `GraduateID`, `title`) VALUES (?, ?, ?)', [Null,studentID,title]);
      await conn.close();
    }
    main();
  }
}

class Chat{
  int ID;
  int FeedbackID;
  String From;
  String To;
  String Message;
  final ScrollController listScrollController = new ScrollController();

  Chat(int id,int feedbackID,String from,String to,String Message){
    this.ID = id;
    this.FeedbackID = feedbackID;
    this.From = from;
    this.To = to;
    this.Message = Message;
  }

  sendChat(int feedbackID){
    Future main() async{
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH, port: DBP, user: DBU, password: DBPAS, db: DBN));
      // Query the database using a parameterized query
      var results = await conn
          .query('INSERT INTO `feedbackchat` (`ID`, `feedbackID`, `message`, `message_source`, `message_destination`) VALUES (NULL, ?, ?, ?, ?)', [feedbackID,this.Message,this.From,this.To]);
      await conn.close();
    }
    //listScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    main();
  }
}

class retrieveChat {
  List<Chat> chat;
  retrieveChat(int graduateID){
    chat = new List();
    Future main() async{
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH, port: DBP, user: DBU, password: DBPAS, db: DBN));
      // Query the database using a parameterized query
      var results = await conn
          .query('SELECT `ID`, `feedbackID`, `message`, `message_source`, `message_destination` FROM `feedbackchat`');

      for (var col in results) {
          int id = col[0];
          int feedbackid = col[1];
          String message = col[2].toString();
          String from = col[3];
          String to = col[4];
          Chat ct = new Chat(id,feedbackid,from,to,message);
          this.chat.add(ct);
      }

      await conn.close();
    }
    main();
  }
}