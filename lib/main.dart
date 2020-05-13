import 'package:flutter/material.dart';
import 'package:go_qa/questao.dart';
import 'package:go_qa/questionario.dart';
import 'package:go_qa/reposta.dart';
import 'package:go_qa/resultado.dart';
import 'package:go_qa/identificacao.dart';


main() => runApp(GoQaApp());

class _GoQaAppState extends State<GoQaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'O que é um teste de caixa branca?',
      'respostas': [
        {'texto': 'Teste baseado na análise da estrutura interna de um componente ou sistema', 'pontuacao': 1},
        {'texto': 'Teste funcional ou não funcional sem referencia a estrutura interna do componente', 'pontuacao': 0},
        {'texto': 'Teta o desempenho da aplicação a fim de encontrar o seu limite de processamento de dados', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Quais dos testes abaixo são testes não funcionais?',
      'respostas': [
        {'texto': 'Testes de desempenho/integração/usabilidade e unidade', 'pontuacao': 0},
        {'texto': 'Testes de desempenho/performance/usabilidade e segurança', 'pontuacao': 1},
        {'texto': 'Testes de usabilidade/portabilidade/segurança e regressivos', 'pontuacao': 0},
      ]
    },
    {
      'texto': '"Ação humana que produz um resultado incorreto", é um(a) ...?',
      'respostas': [
        {'texto': 'defeito', 'pontuacao': 0},
        {'texto': 'erro', 'pontuacao': 1},
        {'texto': 'falha', 'pontuacao': 0},
      ]
    },
    {
      'texto': 'Um campo de entrada referente ao ano de aniversário aceita valores  de 1900 até 2004. Utilizando a análise do valor limite o teste usaria quais valores?',
      'respostas': [
        {'texto': '1899, 1900, 1901,2003,2004,2005', 'pontuacao': 0},
        {'texto': '0,1900,2004,2005', 'pontuacao': 0},
        {'texto': '1899,1900,2004,2005', 'pontuacao': 1},
      ]
    },
    {
      'texto': 'Quais tipos de testes devem ser automatizados?',
      'respostas': [
        {'texto': 'Testes Regressivos', 'pontuacao': 1},
        {'texto': 'Testes de layout', 'pontuacao': 0},
        {'texto': 'Testes de portabilidade', 'pontuacao': 0},
      ]
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Go QA - QIZZ'),
          backgroundColor: Colors.green,
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class GoQaApp extends StatefulWidget {
  _GoQaAppState createState() {
    return _GoQaAppState();
  }
}
