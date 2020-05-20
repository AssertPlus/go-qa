import 'package:test/test.dart';
import 'package:go_qa/resultado.dart';
main() {
  test('Deve exibir texto para pontuação igual a 5', () {
    const pontuacao = 5;
    const textoEsperado = 'Excelente!';

    expect(Resultado.fraseResultado(pontuacao), textoEsperado);
  });
  test('Deve exibir texto para pontuação maior que 2 e menor que 5', () {
    const pontuacao = 3;
    const textoEsperado = 'Parabéns, você foi bem nos testes!';

    expect(Resultado.fraseResultado(pontuacao), textoEsperado);
  });
  test('Deve exibir texto para pontuação menor que 2', () {
    const pontuacao = 2;
    const textoEsperado = 'Infelizmente você foi muito mal, estude um pouco e tente novamente';

    expect(Resultado.fraseResultado(pontuacao), textoEsperado);
  });
}
