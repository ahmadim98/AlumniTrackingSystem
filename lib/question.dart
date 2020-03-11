import 'package:alumniapp/CONDBINFO.dart';
import 'package:mysql1/mysql1.dart';
import 'dart:async';

class Question {
  List<String> Options;
  String QuestionTitle;
  int ChoosenOption;

  Question(String QuestionTitle,List<String> Options){
    this.Options = Options;
    this.QuestionTitle = QuestionTitle;
  }

}

class Survey {
  List<Question> Questions;
  int ID;
  String Surveyname;

  Survey(int id,String surveyname){
    this.ID = id;
    this.Surveyname = surveyname;
  }

}

class Answer{
  int SurveyID;
  int QuestionID;
  int GraduateID;
  String ChoosenOption;

  Answer(int SurveyID,int QuestionID,int GraduateID,String Option){
    this.SurveyID = SurveyID;
    this.QuestionID = QuestionID;
    this.GraduateID = GraduateID;
    this.ChoosenOption = Option;
  }

  SubmitAnswers(){
    Future main() async{
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH, port: DBP, user: DBU, password: DBPAS, db: DBN));
      // Query the database using a parameterized query
      var results = await conn
          .query('INSERT INTO `survey_answers` (`SurveyID`, `QuestionID`, `GraduateID`, `ChoosenOption`) VALUES (?, ?, ?, ?);', [this.SurveyID,this.QuestionID,this.GraduateID,this.ChoosenOption]);
      await conn.close();
    }
    main();
  }
}

class retriveFromDB{
  List<Survey> surveys;
  List<Question> Questions;
  List<Object> QuestionsList;

  retriveFromDB(){
    this.surveys = new List();

    List<String> Options;
    Future main() async{
      String oname;
      Survey sur;
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: '192.168.8.103', port: 3306, user: 'aim', password: '12345678', db: 'alumniapp'));
      // Query the database using a parameterized query
      var results = await conn
          .query('select ID,Surveyname from survey');

      for (var col in results) {
        this.Questions = new List();
        int surveyid = col[0];
        String surveyname = col[1];

        sur = new Survey(surveyid,surveyname);
        var results1 = await conn
            .query('select ID,question from survey_questions where SurveyID = ?', [surveyid]);
        for (var col in results1){
          Options = new List();
          //Options.clear();
          int qid = col[0];
          String qtitle = col[1];
          var results2 = await conn
              .query('select OptionName from survey_options where QuestionID = ? and SurveyID = ?', [qid,surveyid]);
          for(var col in results2){
            //oname = ;
            Options.add(col[0]);
          }
          Question q = new Question(qtitle, Options);
          this.Questions.add(q);
        }
        sur.Questions = this.Questions;
        this.surveys.add(sur);
        print(col);
        print("done added");
      };
      await conn.close();
    }
    main();
  }


}

