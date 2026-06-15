// lib/models/question.dart

class Question {
  final String imageUrl;
  final List<String> options;
  final int correctAnswerIndex;
  final String statement;

  Question({
    required this.imageUrl,
    required this.options,
    required this.correctAnswerIndex,
    required this.statement,
  });
}

List<Question> sampleQuestions = [
  Question(
    statement: 'Desafio 1: Ordene em sequencia logica dos quadros',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/Imagem1.png', // link  direto do GitHub:
    options: [
      'Opção A: (4), (3), (2), (6), (1), (5)', // Índice 0
      'Opção B: (5), (4), (3), (6), (2), (1)', // Índice 1
      'Opção C: (6), (2), (3), (1), (4), (5)', // Índice 2
      'Opção D: (2), (1), (5), (4), (3), (6)', // Índice 3
    ],

    correctAnswerIndex: 0, //Mude aqui a resposta
  ),

  Question(
    statement: 'Desafio 2: Qual das alternativas corresponde ao cubo corretamente montado?',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/imagem2.png', // link  direto do GitHub:
    options: [
      'Opção A:', // Índice 0
      'Opção B:', // Índice 1
      'Opção C:', // Índice 2
      'Opção D:', // Índice 3
    ],

    correctAnswerIndex: 3, //Mude aqui a resposta
  ),

  Question(
    statement: 'Desafio 3: Qual das alternativas corresponde ao cubo corretamente desmontado?',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/imagem3.png', // link  direto do GitHub:
    options: [
      'Opção A:', // Índice 0
      'Opção B:', // Índice 1
      'Opção C:', // Índice 2
      'Opção D:', // Índice 3
    ],

    correctAnswerIndex: 1, //Mude aqui a resposta
  ),

  Question(
    statement: 'Desafio 4: Qual das alternativas corresponde ao cubo corretamente desmontado?',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/imagem4.png', // link  direto do GitHub:
    options: [
      'Opção A: ', // Índice 0
      'Opção B: ', // Índice 1
      'Opção C: ', // Índice 2
      'Opção D: ', // Índice 3
    ],

    correctAnswerIndex: 0, //Mude aqui a resposta
  ),

  Question(
    statement: 'Desafio 5: Qual das figuras apresenta a mesma divisão interna e forma do modelo?',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/imagem5.png', // link  direto do GitHub:
    options: [
      'Opção A: ', // Índice 0
      'Opção B:', // Índice 1
      'Opção C: ', // Índice 2
      'Opção D:', // Índice 3
    ],

    correctAnswerIndex: 1, //Mude aqui a resposta
  ),

  Question(
    statement: 'Desafio 6: Qual das alternativas mostra corretamente o cubo após sua montagem?',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/imagem6.png', // link  direto do GitHub:
    options: [
      'Opção A: ', // Índice 0
      'Opção B:', // Índice 1
      'Opção C: ', // Índice 2
      'Opção D:', // Índice 3
    ],

    correctAnswerIndex: 2, //Mude aqui a resposta
  ),

  Question(
    statement: 'Desafio 7: Qual das alternativas corresponde ao cubo corretamente montado?',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/imagem7.png', // link  direto do GitHub:
    options: [
      'Opção A: ', // Índice 0
      'Opção B:', // Índice 1
      'Opção C: ', // Índice 2
      'Opção D:', // Índice 3
    ],

    correctAnswerIndex: 2, //Mude aqui a resposta
  ),

  Question(
    statement: 'Desafio 8: Marque qual figura representa o modelo',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/imagem8.png', // link  direto do GitHub:
    options: [
      'Opção A: ', // Índice 0
      'Opção B:', // Índice 1
      'Opção C: ', // Índice 2
      'Opção D:', // Índice 3
    ],

    correctAnswerIndex: 2, //Mude aqui a resposta
  ),

  Question(
    statement: 'Desafio 9: Marque qual figura representa o modelo',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/imagem9.png', // link  direto do GitHub:
    options: [
      'Opção A: ', // Índice 0
      'Opção B:', // Índice 1
      'Opção C: ', // Índice 2
      'Opção D:', // Índice 3
    ],

    correctAnswerIndex: 2, //Mude aqui a resposta
  ),

  Question(
    statement: 'Desafio 10: Qual das alternativas corresponde à mesma configuração quando isolada da malha?',

    imageUrl:
        'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/imagem10.png', // link  direto do GitHub:
    options: [
      'Opção A: ', // Índice 0
      'Opção B:', // Índice 1
      'Opção C: ', // Índice 2
      'Opção D:', // Índice 3
    ],

    correctAnswerIndex: 0, //Mude aqui a resposta
  ),
];
