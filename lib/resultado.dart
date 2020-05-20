import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  final String name;
  final int _perguntas;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario, this.name, this._perguntas);

  String get fraseResultado {
    if (pontuacao > 4) {
      return 'Excelente!';
    } else if (pontuacao > 2 && pontuacao < 5) {
      return 'Parabéns, você foi bem nos testes!';
    } else {
      return 'Infelizmente você foi muito mal, estude um pouco e tente novamente';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 26),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    fraseResultado,
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center,
                    key: Key('text_result'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Você acertou $pontuacao/$_perguntas',
                    style: TextStyle(fontSize: 26),
                    textAlign: TextAlign.center,
                    key: Key('text_quantity'),
                  ),
                )
              ],
            ),
          ),
          FlatButton(
            child: Text(
              'Reiniciar?',
              style: TextStyle(
                fontSize: 18,
                color: Colors.green
              ),
            ),
            textColor: Colors.blue,
            onPressed: quandoReiniciarQuestionario,
            key: Key('restart_button'),
          )
        ],
      ),
    );
  }
}
