import 'package:mysql1/mysql1.dart';
import 'dart:async';
import 'CONDBINFO.dart';
import 'package:twitter_api/twitter_api.dart';

class AlumniController {
  AlumniController();

}

class Alumni {
  int ID;
  int Password;
  bool LoggedIn;

  Alumni(int ID, int Password) {
    this.ID = ID;
    this.Password = Password;

    int result = 0;
    Future main() async {
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH,
          port: DBP,
          user: DBU,
          password: DBPAS,
          db: DBN));
      var results = await conn
          .query('select ID from alumni where ID = ?', [ID]);

      for (var col in results) {
        result = col[0]; //to get the first result
      }
      print(result);
      if (result == 0) {
        this.LoggedIn = false;
      } else {
        this.LoggedIn = true;
      }
      await conn.close();
    }
    main();
  }

}

class Profile {
  String Name;
  String Major;
  String Twitteraccount;
  String Phone;
  List<Experience> Experiences;
  //List<Place> Places;
  int NumAffectedRows;

  Profile(int StudentID) {
    this.Experiences = new List();
    //this.Places = new List();

    Future getProfile() async {
      final conn = await MySqlConnection.connect(
          ConnectionSettings(
              host: DBH,
              port: DBP,
              user: DBU,
              password: DBPAS,
              db: DBN));
      var results = await conn
          .query('select * from profile where GraduateID = ?', [StudentID]);
      for (var row in results) {
        print(row['Name']);
        this.Name = row['Name'];
        print(row['Major']);
        this.Major = row['Major'];
        print(row['TwitterAccount']);
        this.Twitteraccount = row['TwitterAccount'];
        print(row['Phone']);
        this.Phone = row['Phone'].toString();
      }
    }
    getProfile();
    if (Experiences.isNotEmpty) {
      Experiences.clear();
    }
    Future getExperiences() async {
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH,
          port: DBP,
          user: DBU,
          password: DBPAS,
          db: DBN));
      // Query the database using a parameterized query
      var results = await conn.query(
          'SELECT * FROM `experience` WHERE GraduateID=?', [StudentID]);
      for (var col in results) {
        Experience experience = new Experience(col[0], col[1], col[2], col[4], col[3]);
        this.Experiences.add(experience);
      }
      await conn.close();
      print('${Experiences.length}+hiiii ');
    }
    getExperiences();
  }

  updateProfile(int StudentID) {
    Future getProfile() async {
      final conn = await MySqlConnection.connect(
          ConnectionSettings(
              host: DBH,
              port: DBP,
              user: DBU,
              password: DBPAS,
              db: DBN));
      var results = await conn
          .query('select * from profile where GraduateID = ?', [StudentID]);
      for (var row in results) {
        print(row['Name']);
        this.Name = row['Name'];
        print(row['Major']);
        this.Major = row['Major'];
        print(row['TwitterAccount']);
        this.Twitteraccount = row['TwitterAccount'];
        print(row['Phone']);
        this.Phone = row['Phone'].toString();
      }
    }
    getProfile();
    if (Experiences.isNotEmpty) {
      Experiences.clear();
    }
    Future getExperiences() async {
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH,
          port: DBP,
          user: DBU,
          password: DBPAS,
          db: DBN));
      // Query the database using a parameterized query
      var results = await conn.query(
          'SELECT * FROM `experience` WHERE GraduateID=?', [StudentID]);
      for (var col in results) {
        Experience experience = new Experience(col[0], col[1], col[2], col[3], col[4]);
        this.Experiences.add(experience);
      }
      await conn.close();
      print('${Experiences.length}+hiiii ');
    }
    getExperiences();
  }

  editProfile(String Field, String newValue, int StudentID) {
    Future editProfile() async {
      final conn = await MySqlConnection.connect(
          ConnectionSettings(
              host: DBH,
              port: DBP,
              user: DBU,
              password: DBPAS,
              db: DBN));
      var result = await conn.query(
          'UPDATE profile SET $Field = ? WHERE GraduateID = ?',
          [newValue, StudentID]);
    }
    editProfile();
  }

  int insertNewExperience(Experience experience) {
    Future insertNewExperience() async {
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH,
          port: DBP,
          user: DBU,
          password: DBPAS,
          db: DBN));
      // Query the database using a parameterized query
      var results = await conn.query(
          'insert into experience (Job_title, Start_Date, End_Date, Place, GraduateID) VALUES (?, ?, ?, ?, ?)',
          [
            '${experience.jobTitle}',
            '${experience.startDate.year}-${experience.startDate
                .month}-${experience.startDate.day}',
            '${experience.endDate.year}-${experience.endDate.month}-${experience
                .endDate.day}',
            '${experience.Place}',
            experience.GraduateID
          ]);
      NumAffectedRows = results.affectedRows;
      await conn.close();
      print('${results.affectedRows} NAR');
    }
    insertNewExperience();
    return NumAffectedRows;
  }

  deleteExperience(Experience experience) {
    Future deleteExperience() async {
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH,
          port: DBP,
          user: DBU,
          password: DBPAS,
          db: DBN));
      // Query the database using a parameterized query
      var results = await conn.query(
          'DELETE FROM `experience` WHERE `Job_title` = ? AND `Start_Date` = ? AND `End_Date` = ? AND `GraduateID` = ?',
          [
            '${experience.jobTitle}',
            '${experience.startDate.year}-${experience.startDate
                .month}-${experience.startDate.day}',
            '${experience.endDate.year}-${experience.endDate.month}-${experience
                .endDate.day}',
            '${experience.GraduateID}'
          ]);
      await conn.close();
    }
    deleteExperience();
  }

  followTwitter(String alumniTwitter) {
    Future twitterFollow() async {
      // Setting placeholder api keys
      String consumerApiKey = "";
      String consumerApiSecret = "";
      String accessToken = "";
      String accessTokenSecret = "";

      // Creating the twitterApi Object with the secret and public keys
      // These keys are generated from the twitter developer page
      // Dont share the keys with anyone
      final _twitterOauth = new twitterApi(
          consumerKey: consumerApiKey,
          consumerSecret: consumerApiSecret,
          token: accessToken,
          tokenSecret: accessTokenSecret
      );
      print(alumniTwitter);
      // Make the request to twitter
      Future twitterRequest = _twitterOauth.getTwitterRequest(
        // Http Method
        "POST",
        // Endpoint you are trying to reach
        "friendships/create.json",
        // The options for the request
        options: {
          "screen_name": alumniTwitter,
          "follow": "true",
        },
      );

      // Wait for the future to finish
      var res = await twitterRequest;

      // Print off the response
      print(res.statusCode);
      print(res.body);
    }
    twitterFollow();
  }
}


/*class Place {
  String name;

  Place(String name) {
    this.name = name;
  }
}*/

class Experience {
  int GraduateID;
  String jobTitle;
  DateTime startDate;
  DateTime endDate;
  String Place;

  Experience(String jobTitle, DateTime startDate, DateTime endDate,
      int GraduateID, String place) {
    this.GraduateID = GraduateID;
    switch(jobTitle){
      case "Developer":
        this.jobTitle = "dev";
        break;
      case "Design":
        this.jobTitle = "des";
        break;
      case "Analyst":
        this.jobTitle = "anal";
        break;
      default:
        this.jobTitle = "other";
        //break;
    }

    this.startDate = startDate;
    this.endDate = endDate;
    this.Place = place;
  }
}