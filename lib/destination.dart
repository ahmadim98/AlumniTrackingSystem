import 'dart:async';
import 'package:flutter/material.dart';

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