import 'package:flutter/material.dart';

class Identificacao extends StatelessWidget {
  final String nome;

  Identificacao(this.nome);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
        child: Text('Tela inicial'),
      ),
    );
  }
}
