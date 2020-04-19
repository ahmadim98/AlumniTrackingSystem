// Flutter code sample for

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)
import 'dart:async';
import 'package:alumniapp/ChatView.dart';
import 'package:flutter/material.dart';
import 'Destination.dart';
import 'ChatView.dart';
import 'ProfileView.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'Loader.dart';

import 'SurveyView.dart';
import 'ChatController.dart';
import 'AlumniController.dart';
import 'SurveyController.dart';

int studentID;
const bool loggedin = false;
SurveyController SVController = new SurveyController();
FeedbackController FDController = new FeedbackController(studentID);
ChatController CTController;
bool addNewChat = false;

class RootPage extends StatelessWidget {
  const RootPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  Widget _RPage(BuildContext context) {
    if (destination.page == "feedback") {
      CTController = new ChatController(studentID);
      String nameOfNewFeedback = "";
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(destination.title),
          backgroundColor: destination.color,
          actions: <Widget>[
            // action button

            // action button
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                addNewChat = true;
                (context as Element).reassemble();
              },
            ),
          ],
        ),
        body: SizedBox.expand(
          child: ListView.builder(
            itemCount: FDController.Feedbacks.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index < FDController.Feedbacks.length) {
                return Card(
                  //margin: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              "/feedback",
                              arguments: {
                                'chat': CTController.chat,
                                'feedbackID': index + 1,
                                'feedbackTitle':
                                    FDController.Feedbacks[index].title
                              },
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'feedback $index',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 28,
                                ),
                              ),
                              Text(
                                'feedback :' +
                                    FDController.Feedbacks[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 28,
                                ),
                              ),
                              Icon(
                                Icons.chat,
                                color: Colors.lightBlue,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Visibility(
                  child: Card(
                    //margin: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Open new Feedback',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 28,
                                ),
                              ),
                              Icon(
                                Icons.mail,
                                color: Colors.green,
                                size: 20,
                              ),
                              Text(
                                'Set the name of feedback',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Here'),
                                onChanged: (str) {
                                  nameOfNewFeedback = str;
                                },
                              ),
                              ButtonBar(
                                mainAxisSize: MainAxisSize.min,
                                // this will take space as minimum as posible(to center)
                                children: <Widget>[
                                  new RaisedButton(
                                    child: new Text('Add'),
                                    onPressed: () {
                                      FDController.insertNewFeedback(
                                          nameOfNewFeedback);
                                      addNewChat = false;
                                      Timer timer =
                                          new Timer(new Duration(seconds: 1), () {
                                        FDController =
                                            new FeedbackController(studentID);
                                        (context as Element).reassemble();
                                      });
                                    },
                                  ),
                                  new RaisedButton(
                                    child: new Text('Cancel'),
                                    onPressed: () {
                                      addNewChat = false;
                                      (context as Element).reassemble();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  visible: addNewChat,
                );
              }
            },
          ),
        ),
      );
    } else if (destination.page == "surveys") {
      print(SVController.Surveys.length);
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(destination.title),
          backgroundColor: destination.color,
          /*leading: IconButton(
          icon: Icon(Icons),
          onPressed: () {

          },
        ),*/
          actions: <Widget>[
            // action button

            // action button
          ],
        ),
        //backgroundColor: destination.color[50],
        body: SizedBox.expand(
          child: ListView.builder(
            itemCount: SVController.Surveys.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                //margin: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/showsurvey",
                              arguments: SVController.Surveys[index]);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              SVController.Surveys[index].Surveyname,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 28,
                              ),
                            ),
                            Text(
                              '28 People have answered',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.done_all,
                              color: Colors.green,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else if (destination.page == "profile") {
      return profile(studentID: studentID);
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(destination.title),
          backgroundColor: destination.color,
          /*leading: IconButton(
          icon: Icon(Icons),
          onPressed: () {

          },
        ),*/
        ),
        //backgroundColor: destination.color[50],
        body: SizedBox.expand(
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/list");
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _RPage(context);
  }
}

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return RootPage(destination: widget.destination);
              case '/login':
                return LoginPage(destination: widget.destination);
              case '/feedback':
                final Map arguments =
                    ModalRoute.of(context).settings.arguments as Map;
                return ChatRoom(
                  chatt: arguments['chat'],
                  studentID: studentID,
                  feedbackID: arguments['feedbackID'],
                  feedbackTitle: arguments['feedbackTitle'],
                );
              case '/showsurvey':
                return showSurvey(
                  destination: widget.destination,
                  surveyy: settings.arguments,
                  studentID: studentID,
                );
              case 'profile':
                return profile(
                  destination: widget.destination,
                  studentID: studentID,
                );
            }
          },
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _currentIndex,
          children: allDestinations.map<Widget>((Destination destination) {
            return DestinationView(destination: destination);
          }).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Icon(destination.icon), title: Text(destination.title));
        }).toList(),
        unselectedItemColor: Colors.grey,
        fixedColor: Colors.lightBlue,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  int _studentid = 0;
  int _password = 0;

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Student ID",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (str) {
        setState(() {
          var id = int.parse(str);
          this._studentid = id;
          studentID = id;
        });
      },
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (str) {
        setState(() {
          var pass = int.parse(str);
          this._password = pass;
        });
      },
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Alumni login = new Alumni(this._studentid, this._password);
          ColorLoader(
            color1: Colors.green,
            color2: Colors.green,
            color3: Colors.green,
          );
          Timer timer = new Timer(new Duration(seconds: 5), () {
            bool checkLogin = login.LoggedIn;
            print(checkLogin);
            if (checkLogin && this._studentid == this._password) {
              Route route = MaterialPageRoute(builder: (context) => HomePage());
              Navigator.push(context, route);
            } else {
              Navigator.pushNamed(context, "/");
            }
          });
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 155.0,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 45.0),
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(
                        height: 35.0,
                      ),
                      loginButon,
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

void main() => runApp(
      Phoenix(
        child: MyApp(),
      ),
    );
