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
import 'package:dash_chat/dash_chat.dart';

class Destination {
  const Destination({@required this.page, @required this.title, @required this.icon, this.color = Colors.lightBlue});
  final String page;
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination(page:'surveys' ,title: 'Survey',icon: Icons.assignment),
  Destination(page:'feedback' ,title: 'Feedback', icon: Icons.comment),
  Destination(page:'profile' ,title: 'Profile',icon: Icons.person),
];

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

class showSurvey extends StatefulWidget {
  const showSurvey({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _showSurvey createState() => _showSurvey();
}

class _showSurvey extends State<showSurvey> {
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
    const List<int> shades = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.title),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: shades.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(

              height: 200,
              child: Card(
                //margin: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                color: Colors.white,
                child: InkWell(
                  /*onTap: () {
                    Navigator.pushNamed(context, "/feedback");
                  },*/
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[ Text('Question $index : ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28,),),
                      new Row(children:[new Radio(value: 0,groupValue: -1,onChanged: (val) {setState(() {});},), new Text("Answer 1"),]),
                      new Row(children:[new Radio(value: 0,groupValue: -1,onChanged: (val) {setState(() {});},), new Text("Answer 2"),]),
                      new Row(children:[new Radio(value: 0,groupValue: -1,onChanged: (val) {setState(() {});},), new Text("Answer 3"),]),
                    ],

                  ),

                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _FeedbackPage createState() => _FeedbackPage();
}

class _FeedbackPage extends State<FeedbackPage> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: '${widget.destination.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.title),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: widget.destination.color[30],

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[ TextField(controller: _textController),
        DashChat(
            //inputToolbarMargin: (EdgeInsets.all(30.0)),
            //inputToolbarPadding: (EdgeInsets.all(30.0)),
            user: ChatUser(
              name: "Jhon Doe",
              uid: "xxxxxxxxx",
              avatar: "https://www.wrappixel.com/ampleadmin/assets/images/users/4.jpg",
            ), onSend: (ChatMessage ) {}, messages: <ChatMessage>[],
        ),
        ]
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

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


void main() => runApp(MyApp());


