#language: pt

Funcionalidade: Responder o questionario
  Para visualizar minha nota no QUIZ
  Eu como usuário com qualidades de QA
  Quero responder todas as questões e visualizar meu resultado ao final

Cenário: Visualizar mensagem ao responder todas as questões
  Dado que o usuário inicia o quiz
  E preencher o nome 'Jhonatas Matos' tocando em começar
  E escolher a resposta 'A) Teste baseado na análise da estrutura interna de um componente ou sistema'
  E escolher a resposta 'B) Testes de desempenho/performance/usabilidade e segurança'
  E escolher a resposta 'B) erro'
  E escolher a resposta 'C) 1899,1900,2004,2005'
  Quando escolher a ultima resposta 'A) Testes Regressivos'
  Então deve visualizar o nome 'Jhonatas Matos'
  E o texto 'Excelente!'
