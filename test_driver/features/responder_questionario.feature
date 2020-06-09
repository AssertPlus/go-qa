#language: pt

Funcionalidade: Responder o questionario
  Para visualizar minha nota no QUIZ
  Eu como usuário com qualidades de QA
  Quero responder todas as questões e visualizar meu resultado ao final

  Esquema do Cenário: Visualizar mensagem ao responder todas as questões
    Dado que o usuário inicia o quiz
    E preencher o nome '<nome>' tocando em começar
    E escolher a resposta '<resposta 1>'
    E escolher a resposta '<resposta 2>'
    E escolher a resposta '<resposta 3>'
    E escolher a resposta '<resposta 4>'
    Quando escolher a ultima resposta '<resposta 5>'
    Então deve visualizar o nome '<nome resultado>'
    E o texto '<texto resultado>'

    Exemplos:
    | nome           | resposta 1                                                                           | resposta 2                                                  | resposta 3 | resposta 4             | resposta 5            | nome resultado | texto resultado                                                    |
    | Jhonatas Matos | A) Teste baseado na análise da estrutura interna de um componente ou sistema         | B) Testes de desempenho/performance/usabilidade e segurança | B) erro    | C) 1899,1900,2004,2005 | A) Testes Regressivos | Jhonatas Matos | Excelente!                                                         |
    | João Pedro     | B) Teste funcional ou não funcional sem referencia a estrutura interna do componente | A) Testes de desempenho/integração/usabilidade e unidade    | C) falha   | B) 0,1900,2004,2005    | B) Testes de layout   | João Pedro     | Infelizmente você foi muito mal, estude um pouco e tente novamente |
    | Fabio Santos   | A) Teste baseado na análise da estrutura interna de um componente ou sistema         | B) Testes de desempenho/performance/usabilidade e segurança | B) erro    | B) 0,1900,2004,2005    | A) Testes Regressivos | Fabio Santos   | Parabéns, você foi bem nos testes!                                 |