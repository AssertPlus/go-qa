import 'package:flutter/material.dart';
import 'package:go_qa/home.dart';


main() => runApp(GoQaApp());

class _GoQaAppState extends State<GoQaApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Go QA - QUIZ'),
          backgroundColor: Colors.green,
        ),
        body: Home()
      ),
    );
  }
}

class GoQaApp extends StatefulWidget {
  _GoQaAppState createState() {
    return _GoQaAppState();
  }
}