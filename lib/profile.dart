import 'package:alumniapp/CONDBINFO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as mysql1;
//import 'package:alumniapp/const.dart';


class profile extends StatefulWidget {


  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  var name;
  var major;
  var phone;

  places selectedPlace;
  final TextEditingController textEditingController = new TextEditingController();

    Future getData() async {
      final conn = await mysql1.MySqlConnection.connect(
          mysql1.ConnectionSettings(
              host: DBH,
              port: DBP,
              user: DBU,
              password: DBPAS,
              db: DBN));
      var results = await conn
          .query('select * from users where ID = ?', [437101893]);
      for (var row in results) {
        name = row['Name'];
        major = row['Major'];
        phone = row['Phone'];
      }
    }

    @override
    void initState() {
      getData();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
        pinned: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Row(
            children: <Widget>[
              Text('profile'),
              /*Padding(
                     padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                     child: CircleAvatar(backgroundImage: AssetImage('assets/user picture.png'),
                      radius: 40,
                  ),
                   ),*/
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
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
                SizedBox(height: 10,),
                Text(
                  '$name',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  'Major',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '$major',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  children: <Widget>[
                    Icon(
                        Icons.phone
                    ),
                    SizedBox(width: 10,),
                    Text(
                      '$phone',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 30, 0),
                  child: DropdownButton<places>(
                    hint: Text('Select place'),
                    value: selectedPlace,
                    onChanged: (places Value){
                      setState((){
                        selectedPlace = Value;
                      });
                    },
                    items: users.map((places user){
                      return  DropdownMenuItem<places>(
                        value: user,
                        child:
                        Text(
                          user.name,
                          style:  TextStyle(color: Colors.black,
                              fontSize: 16,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30,),
                //Twitter
                Text(
                  'Twitter Account',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '@test',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30,),
                Divider(
                  height: 50,
                  color: Colors.grey[600],
                ),
                Text(
                  'Job Title',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Developer',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  'Start Date',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '7/8/2015',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  'End Date',
                  style: TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  '1/5/2018',
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ]
      ),
    );
  }
}
class places{
  const places(this.name);
  final String name;
}
List <places> users=<places>[
  const places('STC'),
  const places('Mobaily')

];