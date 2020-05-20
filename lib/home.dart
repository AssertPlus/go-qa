import 'package:flutter/material.dart';
import 'package:go_qa/identificacao.dart';

class Home extends StatelessWidget {
  static const Key init_button = Key('init_button');

  void _initApp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Identificacao();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 350,
              child: Image.asset(
                'assets/images/gok-logo.png',
                fit: BoxFit.fill,
              ),
            ),
            Text(
              'Seu quiz de qualidade',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              child: RaisedButton(
                key: init_button,
                onPressed: () => _initApp(context),
                child: Text(
                  'Iniciar Quiz',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                color: Colors.green,
                elevation: 4,
              ),
            )
          ],
        ),
      );
  }
}
