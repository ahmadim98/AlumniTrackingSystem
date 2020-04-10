import 'package:mysql1/mysql1.dart';
import 'dart:async';
import 'CONDBINFO.dart';


class Alumni {
  int ID;
  int Password;
  bool LoggedIn;

  Alumni(int ID,int Password){
    this.ID = ID;
    this.Password = Password;

    int result = 0;
    Future main() async{
      // Open a connection (testdb should already exist)
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: DBH, port: DBP,  user: DBU, password: DBPAS, db: DBN));
      // Query the database using a parameterized query
      var results = await conn
          .query('select ID from alumni where ID = ?', [ID]);

      for (var col in results) {
        result = col[0];//to get the first result
      }
      print(result);
      if (result == 0){
        this.LoggedIn = false;
      }else {
        this.LoggedIn = true;
      }
      await conn.close();
    }
    main();
  }

}