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
import 'package:flutter/material.dart';
import 'destination.dart';

import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'survey.dart';
import 'feedback.dart';

const bool loggedin = false;

class RootPage extends StatelessWidget {
  const RootPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;
  //const List<int> shades = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

  Widget _RPage(BuildContext context){
    const List<int> shades = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
    if (destination.page == "feedback" ){
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
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {

              },
            ),
          ],
        ),
        //backgroundColor: destination.color[50],
        body: SizedBox.expand(
          child: ListView.builder(
            itemCount: shades.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(

                height: 150,
                child: Card(
                  //margin: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/feedback");
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[ Text('feedback $index', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28,),),
                        Text('feedback Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28,),),
                        Text('created at : 1/11/2019', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20,),),
                        Icon(Icons.insert_chart, color: Colors.cyan, size: 20,),
                        Icon(Icons.pie_chart, color: Colors.orange, size: 20,),
                      ],

                    ),

                  ),
                ),
              );
            },
          ),
        ),
      );
    }else if(destination.page == "surveys"){
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
            itemCount: shades.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(

                height: 100,
                child: Card(
                  //margin: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/showsurvey");
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[ Text('Survey Title Test', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28,),),
                        Text('28 People have answered', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20,),),
                        Icon(Icons.done_all, color: Colors.green, size: 20,),
                      ],

                    ),

                  ),
                ),
              );
            },
          ),
        ),
      );
    }else if(destination.page == "profile"){

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(destination.title),
          backgroundColor: destination.color,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
              },
            child: Icon(
              Icons.exit_to_app,  // add custom icons also
            ),
          ),
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
    }else {
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

class ListPage extends StatelessWidget {
  const ListPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    const List<int> shades = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];

    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: shades.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 128,
              child: Card(
                color: destination.color[shades[index]].withOpacity(0.25),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/text");
                  },
                  child: Center(
                    child: Text('Item $index', style: Theme.of(context).primaryTextTheme.display1),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TextPage extends StatefulWidget {
  const TextPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: ${widget.destination.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.title),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: widget.destination.color[50],
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(controller: _textController),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class DestinationView extends StatefulWidget {
  const DestinationView({ Key key, this.destination }) : super(key: key);

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
            switch(settings.name) {
              case '/':
                return RootPage(destination: widget.destination);
              case '/list':
                return ListPage(destination: widget.destination);
              case '/login':
                return LoginPage(destination: widget.destination);
              case '/text':
                return TextPage(destination: widget.destination);
              case '/feedback':
                return FeedbackPage(destination: widget.destination);
              case '/showsurvey':
                return showSurvey(destination: widget.destination);
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin<HomePage> {
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
              icon: Icon(destination.icon),
              title: Text(destination.title)
          );
        }).toList(),
        unselectedItemColor: Colors.grey,
        fixedColor: Colors.lightBlue,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => HomePage());
          Navigator.push(context, route);
          },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(

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
                    "logo.png",
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


void main() => runApp(Phoenix(
  child: MyApp(),
),);


