import 'package:mysql1/mysql1.dart';
import 'dart:async';

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
          host: '192.168.8.103', port: 3306, user: 'aim', password: '12345678', db: 'alumniapp'));
      // Query the database using a parameterized query
      var results = await conn
          .query('select ID from alumni where ID = ?', [username]);
      int result2;
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