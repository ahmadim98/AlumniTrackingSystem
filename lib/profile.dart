import 'dart:math';

import 'package:alumniapp/CONDBINFO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as mysql1;
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'destination.dart';

//import 'package:alumniapp/const.dart';
import 'package:intl/intl.dart' as intl;

class profile extends StatefulWidget {
  const profile({Key key, this.destination, @required this.studentID})
      : super(key: key);

  final Destination destination;
  final int studentID;

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  final Name = TextEditingController();
  var major;
  var phone;
  var twitteraccount;
  final myController = TextEditingController();
  bool addExperience = false;
  bool startDateSelected = false;
  bool endDateSelected = false;
  final List<experience> exper = new List();

  var changstate = false;
  places selectedPlace;
  final TextEditingController textEditingController =
      new TextEditingController();

  Future getData() async {
    final conn = await mysql1.MySqlConnection.connect(mysql1.ConnectionSettings(
        host: DBH, port: DBP, user: DBU, password: DBPAS, db: DBN));
    var results = await conn.query(
        'select * from profile where GraduateID = ?', [widget.studentID]);
    for (var row in results) {
      print(row['Name']);
      Name.text = row['Name'];
      print(row['Major']);
      major = row['Major'];
      print(row['TwitterAccount']);
      twitteraccount = row['TwitterAccount'];
      print(row['Phone']);
      phone = row['Phone'];
    }
    await conn.close();
  }

  @override
  void initState() {
    getExper();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    myController.text = "small rtest";
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Phoenix.rebirth(context);
          },
          child: Icon(
            Icons.exit_to_app,
            color: Colors.white, // add custom icons also
          ),
        ),
        title: Text('Profile'),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/user picture.png'),
                    radius: 40,
                  ),
                ),
                Divider(
                  height: 50,
                  color: Colors.grey[600],
                ),
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                /*Text(
                  '$name',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold
                  ),
                ),*/
                TextField(
                  controller: Name,
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Major',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                new GestureDetector(
                  onTap: () {
                    print("small test :D");
                    changstate = true;
                  },
                  child: new Text(
                    '$major',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: myController,
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.phone),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$phone',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Place',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: DropdownButton<places>(
                    hint: Text('Select place'),
                    value: selectedPlace,
                    onChanged: (places Value) {
                      setState(() {
                        selectedPlace = Value;
                      });
                    },
                    items: users.map((places user) {
                      return DropdownMenuItem<places>(
                        value: user,
                        child: Text(
                          user.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //Twitter
                Text(
                  'Twitter Account',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$twitteraccount',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Divider(
                  height: 50,
                  color: Colors.grey[600],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Experience',
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        addExperience = true;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Visibility(
                  child: Wrap(
                    children: <Widget>[
                      Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Add new Experience',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Job Title',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter Here'),
                                onChanged: (job) {},
                              ),
                              Text(
                                'Start Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Visibility(
                                child: Text(
                                  '${sDate.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                visible: startDateSelected,
                              ),
                              IconButton(
                                onPressed: () {
                                  selectStartDate(context);
                                },
                                icon: Icon(Icons.calendar_today),
                              ),
                              Text(
                                'End Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Visibility(
                                child: Text(
                                  '${eDate.toString()}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                visible: endDateSelected,
                              ),
                              IconButton(
                                onPressed: () {
                                  selectEndDate(context, sDate);
                                },
                                icon: Icon(Icons.calendar_today),
                              ),
                              ButtonBar(
                                mainAxisSize: MainAxisSize.min,
                                // this will take space as minimum as posible(to center)
                                children: <Widget>[
                                  new RaisedButton(
                                    child: new Text('Add'),
                                    onPressed: () {
                                      addExperience = false;
                                      startDateSelected = false;
                                      endDateSelected = false;
                                    },
                                  ),
                                  new RaisedButton(
                                    child: new Text('Cancel'),
                                    onPressed: () {
                                      addExperience = false;
                                      startDateSelected = false;
                                      endDateSelected = false;
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  visible: addExperience,
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              print('${exper.length} 333');
              if (index < exper.length) {
                print('object');
                return Card(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      textDirection: TextDirection.ltr,
                      alignment: WrapAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Job Title:',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 2,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${exper[index].jobTitle}',
                              style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Start Date:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${intl.DateFormat.yMd('en_US').format(exper[index].startDate)}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'End Date',
                                      style: TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${intl.DateFormat.yMd('en_US').format(exper[index].endDate)}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            childCount: exper.length,
          ),
        ),
      ]),
    );
  }

  //Start Date
  DateTime sDate = new DateTime.now();

  //End Date
  DateTime eDate = new DateTime.now();

  Future<Null> selectStartDate(BuildContext context) async {
    final DateTime piked = await showDatePicker(
      context: context,
      initialDate: sDate,
      firstDate: new DateTime(1950),
      lastDate: new DateTime.now(),
    );
    if (piked != null && piked != sDate) {
      setState(() {
        sDate = piked;
        startDateSelected = true;
      });
    }
  }

  Future<Null> selectEndDate(BuildContext context, sDate) async {
    final DateTime piked = await showDatePicker(
      context: context,
      initialDate: sDate,
      firstDate: sDate,
      lastDate: new DateTime.now(),
    );
    if (piked != null && piked != sDate) {
      setState(() {
        eDate = piked;
        endDateSelected = true;
      });
    }
  }

  Future getExper() async {
    // Open a connection (testdb should already exist)
    final conn = await mysql1.MySqlConnection.connect(mysql1.ConnectionSettings(
        host: DBH, port: DBP, user: DBU, password: DBPAS, db: DBN));
    // Query the database using a parameterized query
    var results = await conn.query(
        'SELECT * FROM `experience` WHERE GraduateID=?', [widget.studentID]);

    for (var col in results) {
      experience exp = new experience(col[0], col[1], col[2], col[3], col[4]);

      this.exper.add(exp);
    }
    await conn.close();
    print('${exper.length}+hiiii ');
  }
}

class places {
  const places(this.name);

  final String name;
}

List<places> users = <places>[const places('STC'), const places('Mobaily')];

class experience {
  int id;
  int graduateID;
  String jobTitle;
  DateTime startDate;
  DateTime endDate;

  experience(int id, String jobTitle, DateTime startDate, DateTime endDate,
      int graduateId) {
    this.id = id;
    this.graduateID = graduateId;
    this.jobTitle = jobTitle;
    this.startDate = startDate;
    this.endDate = endDate;
  }
}
