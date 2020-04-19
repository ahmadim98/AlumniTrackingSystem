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

  test('Create new experience', () {
    //Alumni result = new Alumni();
    Profile result = new Profile(437101237);
    Timer timer = new Timer(new Duration(seconds: 1), () {
      int expected = 5555555555;
      expect(result.Phone, expected);
    });
  });
}
