import 'package:flutter/material.dart';
import 'package:go_qa/questions.dart';

class Identificacao extends StatelessWidget {
  final nameController = TextEditingController();

  void _startApp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return Scaffold(body: Questions(nameController.text));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Identificação',
          ),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'Preencha seu nome',
                    labelStyle: TextStyle(
                      fontSize: 14,
                    )),
                controller: nameController,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 100, 0),
                child: Text(
                  'Campo de preenchimento obrigatório*',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 50),
                child: RaisedButton(
                  onPressed: () =>
                      nameController.text != '' ? _startApp(context) : null,
                  child: Text(
                    'Começar',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.green,
                  elevation: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
