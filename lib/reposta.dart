import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.only(top: 15),
        child: RaisedButton(
          child: Text(
            texto,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: quandoSelecionado,
          color: Colors.green,
        ),
      ),
    );
  }
}
