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
    statement: 'Desafio 1: Ordene em sequencia logica os quadros',
    
    imageUrl: 'https://raw.githubusercontent.com/Ycaro0110/app_trabalho/main/imagens_quiz/Imagem1.png', // link  direto do GitHub:
    options: [
      'Opção A: (4), (3), (2), (6), (1), (5)', // Índice 0
      'Opção B: (5), (4), (3), (6), (2), (1)', // Índice 1
      'Opção C: (6), (2), (3), (1), (4), (5)', // Índice 2
      'Opção D: (2), (1), (5), (4), (3), (6)', // Índice 3
    ],
    
    correctAnswerIndex: 0, //Mude aqui a resposta
  ),
];