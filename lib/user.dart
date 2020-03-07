import 'package:mysql1/mysql1.dart';
import 'dart:async';
import 'CONDBINFO.dart';


class User {
  int username;
  int password;
  bool loggedin;

  User(int username,int password){
    this.username = username;
    this.password = password;

    int result = 0;
    Future main() async{
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH, port: DBP,  user: DBU, password: DBPAS, db: DBN));
      // Query the database using a parameterized query
      var results = await conn
          .query('select ID from alumni where ID = ?', [username]);

      for (var col in results) {
        result = col[0];//to get the first result
      }
      print(result);
      if (result == 0){
        this.loggedin = false;
      }else {
        this.loggedin = true;
      }
      await conn.close();
    }
    main();
  }

}