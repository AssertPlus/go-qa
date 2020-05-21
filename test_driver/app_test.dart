import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;
  final initButton = find.byValueKey('init_button');
  final startButton = find.byValueKey('start_button');
  final textFieldName = find.byValueKey('text_field_name');
  final answer1 = find.text(
      'A) Teste baseado na análise da estrutura interna de um componente ou sistema');
  final answer2 =
      find.text('B) Testes de desempenho/performance/usabilidade e segurança');
  final answer3 = find.text('B) erro');
  final answer4 = find.text('C) 1899,1900,2004,2005');
  final answer5 = find.text('A) Testes Regressivos');
  final textResult = find.byValueKey('text_result');
  final String correctAnswerText = 'Excelente!';

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  //Método para tirar screenshot
  takeScreenshot(FlutterDriver driver, String name) async {
    final List<int> pixels = await driver.screenshot();
    final File file = new File("test_driver/screenshots/$name.png");
    await file.writeAsBytes(pixels);
  }

  // test('check flutter driver health', () async {
  //   final health = await driver.checkHealth();
  //   expect(health.status, HealthStatus.ok);
  // });

  test('Responder as questões e visualizar o resultado Excelente', () async {
    //Toca no botão iniciar quiz
    await driver.tap(initButton);

    //Toca no input de nome
    await driver.tap(textFieldName);

    //Preenche o nome Jhonatas no input
    await driver.enterText('Jhonatas');

    //Toca no botão começar
    await driver.tap(startButton);

    //Escolher a resposta da questão 1
    await driver.tap(answer1);

    //Escolher a resposta da questão 2
    await driver.tap(answer2);

    //Escolher a resposta da questão 3
    await driver.tap(answer3);

    //Escolher a resposta da questão 4
    await driver.tap(answer4);

    //Escolher a resposta da questão 5
    await driver.tap(answer5);

    //Tira print da tela de resultado
    await takeScreenshot(driver, "teste_integrado");

    //Verifica se apareceu o texto esperado
    expect(await driver.getText(textResult), correctAnswerText);
  });
}
