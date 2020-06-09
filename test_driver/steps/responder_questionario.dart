import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import '../pages/home_page.dart';
import '../pages/identification_page.dart';
import '../pages/questions_page.dart';
import '../pages/result_page.dart';

class InitQuiz extends GivenWithWorld<FlutterWorld> {
  InitQuiz()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    HomePage homePage = HomePage(world.driver);

    await homePage.tapInitQuiz();
  }

  @override
  RegExp get pattern => RegExp(r"que o usuário inicia o quiz");
}

class FillName extends Then1WithWorld<String, FlutterWorld> {
  FillName()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String name) async {
    IdentificationPage identificationPage = IdentificationPage(world.driver);

    await identificationPage.tapTextField();
    await identificationPage.fillName(name);
    await identificationPage.tapStart();
  }

  @override
  RegExp get pattern => RegExp(r"preencher o nome {string} tocando em começar");
}

class AnswerQuestions extends And1WithWorld<String, FlutterWorld> {
  AnswerQuestions()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String answer) async {
    QuestionsPage questionsPage = QuestionsPage(world.driver);

    await questionsPage.tapAnswer(answer);
  }

  @override
  RegExp get pattern => RegExp(r"escolher a resposta {string}");
}

class AnswerLastQuestion extends When1WithWorld<String, FlutterWorld> {
  AnswerLastQuestion()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String answer) async {
    QuestionsPage questionsPage = QuestionsPage(world.driver);

    await questionsPage.tapAnswer(answer);
  }

  @override
  RegExp get pattern => RegExp(r"escolher a ultima resposta {string}");
}

class VerifyName extends Then1WithWorld<String, FlutterWorld> {
  VerifyName()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String name) async {
    ResultPage resultPage = ResultPage(world.driver);

    expectMatch(await resultPage.getName(), name);
  }

  @override
  RegExp get pattern => RegExp(r"deve visualizar o nome {string}");
}

class VerifyResult extends Then1WithWorld<String, FlutterWorld> {
  VerifyResult()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep(String textResult) async {
    ResultPage resultPage = ResultPage(world.driver);

    expectMatch(await resultPage.getTextResult(), textResult);
  }

  @override
  RegExp get pattern => RegExp(r"o texto {string}");
}
