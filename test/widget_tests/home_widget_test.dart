import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_qa/home.dart';
import 'package:go_qa/identificacao.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Iniciar quiz, navegar para a tela de identificação',
      (WidgetTester tester) async {
    NavigatorObserver mockObserver;
    mockObserver = MockNavigatorObserver();

    //Criando a tela Home com o mock
    await tester.pumpWidget(
        MaterialApp(home: Home(), navigatorObservers: [mockObserver]));

    //Executando a ação de tap no botao iniciar quiz
    await tester.tap(find.byKey(Home.init_button));
    await tester.pumpAndSettle();

    //Ao tocar no botão navegamos na tela Identificação
    //O método didPush () deveria ter sido chamado ...
    verify(mockObserver.didPush(any, any));

    //Deve haver uma Identificacao presente na árvore de widgets ...
    expect(find.byType(Identificacao), findsOneWidget);

    //Com o botão que tem a Key start_button
    // expect(find.byKey(Key('start_button')), findsOneWidget);
    expect(find.byKey(Key('start_button')), findsOneWidget);
  });

  testWidgets(
      'Não preencher nome e ao clicar no botão iniciar continuar na mesma tela',
      (WidgetTester tester) async {
    NavigatorObserver mockObserver;
    mockObserver = MockNavigatorObserver();

    //Criando a tela Identificacao com o mock
    await tester.pumpWidget(
        MaterialApp(home: Identificacao(), navigatorObservers: [mockObserver]));

    //Executando a ação de tap no botao iniciar quiz
    await tester.tap(find.byKey(Identificacao.start_button));
    await tester.pumpAndSettle();

    //Ao tocar no botão não navegamos para a tela seguinte
    //O método didPush () deve ser chamado mas nada deve acontecer ...
    verify(mockObserver.didPush(any, any));

    //Deve cotninuar na tela Identificacao ...
    expect(find.byType(Identificacao), findsOneWidget);

    //Com o botão que tem a Key start_button
    expect(find.byKey(Key('start_button')), findsOneWidget);
  });

  testWidgets(
      'Preencher nome e ao clicar no botão iniciar continuar navegar para a próxima tela',
      (WidgetTester tester) async {
    NavigatorObserver mockObserver;
    mockObserver = MockNavigatorObserver();

    //Criando a tela Identificacao com o mock
    await tester.pumpWidget(
        MaterialApp(home: Identificacao(), navigatorObservers: [mockObserver]));

    //Preenchendo o nome
    await tester.enterText(
        find.byKey(Identificacao.text_field_name), 'Jhonatas');

    //Executando a ação de tap no botao iniciar quiz
    await tester.tap(find.byKey(Identificacao.start_button));
    await tester.pumpAndSettle();

    //Ao tocar no botão navegamos para a tela seguinte
    //O método didPush () deve ser chamado ...
    verify(mockObserver.didPush(any, any));

    //Avança para a próxima tela
    //E não exibe mais o botão que tem a Key start_button
    expect(find.byKey(Key('start_button')), findsNothing);
  });

  testWidgets('Responder as questões e visualizar o resultado Excelente',
      (WidgetTester tester) async {
    NavigatorObserver mockObserver;
    mockObserver = MockNavigatorObserver();

    //Criando a tela Identificacao com o mock
    await tester.pumpWidget(
        MaterialApp(home: Identificacao(), navigatorObservers: [mockObserver]));

    //Preenchendo o nome
    await tester.enterText(
        find.byKey(Identificacao.text_field_name), 'Jhonatas');

    //Executando a ação de tap no botao iniciar quiz
    await tester.tap(find.byKey(Identificacao.start_button));
    await tester.pumpAndSettle();

    //Executando a ação de tap na opção A da questão 1
    await tester.tap(find.text(
        'A) Teste baseado na análise da estrutura interna de um componente ou sistema'));
    await tester.pumpAndSettle();

    //Executando a ação de tap na opção B da questão 2
    await tester.tap(find
        .text('B) Testes de desempenho/performance/usabilidade e segurança'));
    await tester.pumpAndSettle();

    //Executando a ação de tap na opção B da questão 3
    await tester.tap(find.text('B) erro'));
    await tester.pumpAndSettle();

    //Executando a ação de tap na opção C da questão 4
    await tester.tap(find.text('C) 1899,1900,2004,2005'));
    await tester.pumpAndSettle();

    //Executando a ação de tap na opção A da questão 5
    await tester.tap(find.text('A) Testes Regressivos'));
    await tester.pumpAndSettle();

    //Avança para a tela de resultado e encontra o texto com o resultado do teste
    expect(find.byKey(Key('text_result')), findsOneWidget);

    //Encontra o texto "Excelente!" ao escolher todas as respostas certas
    expect(find.text('Excelente!'), findsOneWidget);
  });
}
