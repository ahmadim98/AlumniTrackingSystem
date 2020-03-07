import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:alumniapp/const.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  final TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(


        title: Text('Profile'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        leading: GestureDetector(
          onTap: () {
            Phoenix.rebirth(context);
          },
          child: Icon(
            Icons.exit_to_app,  // add custom icons also
          ),
        ),
      ),
      body: Padding(
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
              'Abdulrhman Bin Shmlan',
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
              'Software Engineering',
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
                  '0534671851',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}