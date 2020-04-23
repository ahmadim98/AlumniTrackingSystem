import 'package:alumniapp/AlumniController.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:async';
//import '';

void main() {
  test('Login into the system', () {
    //Alumni result = new Alumni();
    Alumni result = new Alumni(437101237,437101237);
    Timer timer = new Timer(new Duration(seconds: 3), () {
      bool expected = true;
      expect(result.LoggedIn, expected);
    });
  });

  test('Edit the profile of alumni', () {
    //Alumni result = new Alumni();
    Profile result = new Profile(437101237);
    Timer timer = new Timer(new Duration(seconds: 1), () {
      result.editProfile("Phone", "5555555", 437101237);
      Timer timer = new Timer(new Duration(seconds: 1), () {
        result.updateProfile(437101237);
        Timer timer = new Timer(new Duration(seconds: 1), () {
          int expected = 5555555555;
          expect(result.Phone, expected);
        });
      });
    });
  });

  test('Follow Twitter Account of the alumni', () {
    //Alumni result = new Alumni();
    Profile result = new Profile(437101237);
    Timer timer = new Timer(new Duration(seconds: 1), () {
      int expected = 5555555555;
      expect(result.Phone, expected);
    });
  });

  /*test('Add New Experience', () async{
    Profile result = new Profile(437101237);
    DateTime startDate =  new DateTime.utc(2005, 11, 9);
    DateTime endDate =  new DateTime.utc(2007, 12, 28);
      Experience experience = new Experience('Test1', startDate, endDate, 437101237);
    var expected;
      @override
    void initState() async{
     expected = await result.insertNewExperience(experience);
      }
      print(expected);
      expect(expected, 1);
  });*/

}
