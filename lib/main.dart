import 'package:flutter/material.dart';
import 'package:go_qa/home.dart';

main() => runApp(GoQA());
class GoQA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
