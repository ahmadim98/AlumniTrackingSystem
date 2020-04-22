import 'dart:async';
import 'package:alumniapp/AlumniView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'Destination.dart';
import 'package:intl/intl.dart' as intl;

import 'AlumniController.dart';

class profile extends StatefulWidget {
  const profile({Key key, this.destination, @required this.studentID})
      : super(key: key);

  final Destination destination;
  final int studentID;

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  //here is the controllers which will control our text fields and edit them.
  final TextEditingController Name = TextEditingController();
  final TextEditingController Major = TextEditingController();
  final TextEditingController Phone = TextEditingController();
  final TextEditingController Twitteraccount = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  //these state indicate either we need to show specific widgets or not
  bool addExperience = false;
  bool startDateSelected = false;
  bool endDateSelected = false;

  Profile profile = new Profile(studentID);
  List<Experience> experiences = new List();


  String jobTitle;
  places selectedPlaceExp;
  places selectedPlaceprof;

  getProfileData() {
    Name.text = profile.Name;
    Major.text = profile.Major;
    Twitteraccount.text = profile.Twitteraccount;
    Phone.text = profile.Phone;
    experiences = profile.Experiences;
  }

  @override
  void initState() {
    getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    getProfileData();
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
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
        centerTitle: true,
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /*Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/user picture.png'),
                    radius: 40,
                  ),
                ),
                Divider(
                  height: 50,
                  color: Colors.grey[600],
                ),*/
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
                  onSubmitted: (text) {
                    profile.editProfile("Name", text, widget.studentID);
                    Timer timer = new Timer(new Duration(seconds: 3), () {
                      profile.updateProfile(widget.studentID);
                      final snackBar = SnackBar(
                        content: Text('Change Saved'),
                        backgroundColor: Colors.green,
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      scaffoldkey.currentState.showSnackBar(snackBar);
                    });
                  },
                ),
                SizedBox(
                  height: 10,
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
                TextField(
                  controller: Major,
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                  ),
                  onSubmitted: (text) {
                    profile.editProfile("Major", text, widget.studentID);
                    Timer timer = new Timer(new Duration(seconds: 3), () {
                      profile.updateProfile(widget.studentID);
                      final snackBar = SnackBar(
                        content: Text('Change Saved'),
                        backgroundColor: Colors.green,
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      scaffoldkey.currentState.showSnackBar(snackBar);
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 0,
                      child: Icon(Icons.phone),
                    ),
                    Expanded(
                      child: TextField(
                        controller: Phone,
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold),
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                        ),
                        onSubmitted: (text) {
                          profile.editProfile("Phone", text, widget.studentID);
                          Timer timer = new Timer(new Duration(seconds: 3), () {
                            profile.updateProfile(widget.studentID);
                            final snackBar = SnackBar(
                              content: Text('Change Saved'),
                              backgroundColor: Colors.green,
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            scaffoldkey.currentState.showSnackBar(snackBar);
                          });
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 30, 0),
                  child: DropdownButton<places>(
                    hint: Text('Select place'),
                    value: selectedPlaceprof,
                    onChanged: (places Value) {
                      setState(() {
                        selectedPlaceprof = Value;
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
                TextField(
                  controller: Twitteraccount,
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold),
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                  ),
                  onSubmitted: (text) {
                    profile.editProfile(
                        "TwitterAccount", text, widget.studentID);
                    profile.followTwitter(text);
                    Timer timer = new Timer(new Duration(seconds: 3), () {
                      profile.updateProfile(widget.studentID);
                      final snackBar = SnackBar(
                        content: Text('Change Saved'),
                        backgroundColor: Colors.green,
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      scaffoldkey.currentState.showSnackBar(snackBar);
                    });
                  },
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
                        (context as Element).reassemble();
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
                                onChanged: (job) {
                                  jobTitle = job;
                                },
                              ),
                              Text(
                                'Place',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              DropdownButton<places>(
                                hint: Text('Select place'),
                                value: selectedPlaceExp,
                                onChanged: (places Value) {
                                  setState(() {
                                    selectedPlaceExp = Value;
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
                              Text(
                                'Start Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Visibility(
                                    child: Text(
                                      '${intl.DateFormat.yMd('en_US').format(sDate)}',
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
                                ],
                              ),
                              Text(
                                'End Date',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Visibility(
                                    child: Text(
                                      '${intl.DateFormat.yMd('en_US').format(eDate)}',
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
                                ],
                              ),
                              ButtonBar(
                                mainAxisSize: MainAxisSize.min,
                                // this will take space as minimum as posible(to center)
                                children: <Widget>[
                                  new RaisedButton(
                                    child: new Text('Add'),
                                    onPressed: () {
                                      Experience experience = new Experience(
                                          jobTitle,
                                          sDate,
                                          eDate,
                                          widget.studentID,
                                      selectedPlaceExp.name);
                                      profile.insertNewExperience(experience);

                                      addExperience = false;
                                      startDateSelected = false;
                                      endDateSelected = false;
                                      sDate = new DateTime.now();
                                      eDate = new DateTime.now();
                                      Timer timer = new Timer(
                                          new Duration(seconds: 2), () {
                                        profile.updateProfile(widget.studentID);
                                        (context as Element).reassemble();
                                        final snackBar = SnackBar(
                                          content: Text('Add New Experince Successfully'),
                                          backgroundColor: Colors.green,
                                          action: SnackBarAction(
                                            label: 'OK',
                                            onPressed: () {
                                              // Some code to undo the change.
                                            },
                                          ),
                                        );
                                        scaffoldkey.currentState.showSnackBar(snackBar);
                                      });
                                    },
                                  ),
                                  new RaisedButton(
                                    child: new Text('Cancel'),
                                    onPressed: () {
                                      addExperience = false;
                                      startDateSelected = false;
                                      endDateSelected = false;
                                      sDate = new DateTime.now();
                                      eDate = new DateTime.now();
                                      (context as Element).reassemble();
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
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (index < experiences.length) {
                return Card(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Job Title:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 230,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        //deleteExper('${experiences[index].jobTitle}', '${experiences[index].startDate.year}-${experiences[index].startDate.month}-${experiences[index].startDate.day}', '${experiences[index].endDate.year}-${experiences[index].endDate.month}-${experiences[index].endDate.day}', widget.studentID);
                                        Experience experience = new Experience(
                                            experiences[index].jobTitle,
                                            experiences[index].startDate,
                                            experiences[index].endDate,
                                            widget.studentID,
                                        experiences[index].place);
                                        profile.deleteExperience(experience);
                                        Timer timer = new Timer(
                                            new Duration(seconds: 2), () {
                                          profile
                                              .updateProfile(widget.studentID);
                                          (context as Element).reassemble();
                                          final snackBar = SnackBar(
                                            content: Text('Deleted Successfully'),
                                            backgroundColor: Colors.red,
                                            action: SnackBarAction(
                                              label: 'OK',
                                              onPressed: () {
                                                // Some code to undo the change.
                                              },
                                            ),
                                          );
                                          scaffoldkey.currentState.showSnackBar(snackBar);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${experiences[index].jobTitle}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Place',
                                  style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${experiences[index].place}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
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
                                      '${intl.DateFormat.yMd('en_US').format(experiences[index].startDate)}',
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
                                      '${intl.DateFormat.yMd('en_US').format(experiences[index].endDate)}',
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
            childCount: experiences.length,
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
      initialDate: eDate,
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
}

class places {
  const places(this.name);

  final String name;
}

List<places> users = <places>[const places('STC'), const places('Mobaily'), const places('TC'), const places('IC'), const places('gov'), const places('other')];
