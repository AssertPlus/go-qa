import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if(pontuacao > 4){
      return 'Excelente!';
    }else if(pontuacao > 2 && pontuacao < 5){
      return 'Parabéns, você foi bem nos testes!';
    }else if(pontuacao > 0 && pontuacao < 3){
      return 'Você foi bem!';
    }else {
      return 'Infelizmente você foi muito mal, estude um pouco e tente novamente';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado, 
            style: TextStyle(fontSize: 28),
            ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
