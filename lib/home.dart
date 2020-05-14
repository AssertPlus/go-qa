import 'package:flutter/material.dart';
import 'package:go_qa/identificacao.dart';

class Home extends StatelessWidget {

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
        children: <Widget>[
          Image.asset(
            'assets/images/gok-logo.png',
            height: 150,
            width: double.infinity,
            fit: BoxFit.fill,
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
            width: 220,
            child: RaisedButton(
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
