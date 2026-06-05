// lib/main.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/question.dart';

void main() {
  runApp(const LogicPixelsApp());
}

class LogicPixelsApp extends StatelessWidget {
  const LogicPixelsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LogicPixels',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  int _highScore = 0;
  
  // Variáveis de estado do Jogo
  int _currentQuestionIndex = 0;
  int? _selectedAnswerIndex;
  int _currentScore = 0;

  @override
  void initState() {
    super.initState();
    _loadHighScore();
  }

  // PERSISTÊNCIA: Carrega o Recorde (Item d)
  Future<void> _loadHighScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _highScore = prefs.getInt('high_score') ?? 0;
    });
  }

  // PERSISTÊNCIA: Salva o novo Recorde se for maior (Item d)
  Future<void> _saveHighScore(int score) async {
    if (score > _highScore) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('high_score', score);
      setState(() {
        _highScore = score;
      });
    }
  }

  // MENSAGEM DE INTERAÇÃO: SnackBar e Dialog (Item c)
  void _checkAnswer() {
    if (_selectedAnswerIndex == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, selecione uma opção!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    bool isCorrect = _selectedAnswerIndex == sampleQuestions[_currentQuestionIndex].correctAnswerIndex;

    if (isCorrect) {
      _currentScore += 10;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🎉 Resposta Correta! +10 pontos'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('❌ Resposta Incorreta!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }

    // Avançar para a próxima pergunta ou finalizar
    setState(() {
      if (_currentQuestionIndex < sampleQuestions.length - 1) {
        _currentQuestionIndex++;
        _selectedAnswerIndex = null;
      } else {
        _saveHighScore(_currentScore);
        _showFinishedDialog();
      }
    });
  }

  void _showFinishedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('🏁 Quiz Finalizado!'),
          content: Text('Você fez $_currentScore pontos nesta rodada.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentQuestionIndex = 0;
                  _selectedAnswerIndex = null;
                  _currentScore = 0;
                  _currentIndex = 1; // Leva para a aba de Placar quenado finaliza
                });
              },
              child: const Text('Ver Recorde'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // LAYOUT: Construção dinâmica das abas (Item a)
    final List<Widget> screens = [
      // ABA 1: O JOGO
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          key: ValueKey(_currentQuestionIndex), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Questão ${_currentQuestionIndex + 1} de ${sampleQuestions.length}',
                style: const TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
  
                  // ENUNCIADO:
              Text(
                sampleQuestions[_currentQuestionIndex].statement,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                textAlign: TextAlign.justify,
              ),
  
              const SizedBox(height: 12),
              
              // Zoom (Item b)
              Container(
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: InteractiveViewer(
                    clipBehavior: Clip.hardEdge,
                    maxScale: 4.0,
                    child: Image.network(
                      sampleQuestions[_currentQuestionIndex].imageUrl,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '💡 Dica: Você pode usar o gesto de pinça/scroll para dar zoom na imagem.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 15),
              
              // RadioListTile para as opções (Item b)
              ...List.generate(
                sampleQuestions[_currentQuestionIndex].options.length,
                (index) => RadioListTile<int>(
                  title: Text(sampleQuestions[_currentQuestionIndex].options[index]),
                  value: index,
                  groupValue: _selectedAnswerIndex,
                  onChanged: (value) {
                    setState(() {
                      _selectedAnswerIndex = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              
              // ElevatedButton para Confirmar (Item b)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                onPressed: _checkAnswer,
                child: const Text('Confirmar Resposta', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
      
      // ABA 2: PLACAR ListView
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.emoji_events, size: 80, color: Colors.amber),
            const SizedBox(height: 10),
            const Text('🏆 Seu Recorde Máximo:', style: TextStyle(fontSize: 22)),
            Text('$_highScore Pontos', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.indigo)),
          ],
        ),
      ),
      
      // ABA 3: SOBRE 
      const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('LogicPixels', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.indigo)),
            SizedBox(height: 10),
            Text(
              'Aplicativo desenvolvido para o trabalho prático de Flutter.\n\nObjetivo: Resolver testes de raciocínio lógico visual através de análise de imagens com capacidade de zoom responsivo.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('LogicPixels'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.psychology), label: 'Jogar'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Placar'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Sobre'),
        ],
      ),
    );
  }
}