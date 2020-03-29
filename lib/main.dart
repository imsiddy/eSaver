import 'package:esever/Home.dart';
import 'package:esever/Light.dart';
import 'package:flutter/material.dart';
import 'package:search_widget/search_widget.dart';
import 'Light.dart';


void main() => runApp(Mainclass());

class Mainclass extends StatefulWidget {
  Mainclass({Key key}) : super(key: key);

  @override
  _MainclassState createState() => _MainclassState();
}

class _MainclassState extends State<Mainclass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: MyApp(),
    );
  }
}
