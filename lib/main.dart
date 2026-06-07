import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A148C)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;
  final String category;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.category,
  });
}

const List<Question> questions = [
  Question(
    category: 'Science',
    text: 'What is the chemical symbol for water?',
    options: ['O2', 'H2O', 'CO2', 'HO'],
    correctIndex: 1,
  ),
  Question(
    category: 'Geography',
    text: 'Which is the largest ocean on Earth?',
    options: ['Atlantic', 'Indian', 'Arctic', 'Pacific'],
    correctIndex: 3,
  ),
  Question(
    category: 'History',
    text: 'In which year did World War II end?',
    options: ['1943', '1944', '1945', '1946'],
    correctIndex: 2,
  ),
  Question(
    category: 'Science',
    text: 'How many planets are in our solar system?',
    options: ['7', '8', '9', '10'],
    correctIndex: 1,
  ),
  Question(
    category: 'Geography',
    text: 'What is the capital city of Australia?',
    options: ['Sydney', 'Melbourne', 'Canberra', 'Brisbane'],
    correctIndex: 2,
  ),
  Question(
    category: 'General',
    text: 'Which language is most spoken in the world?',
    options: ['English', 'Spanish', 'Hindi', 'Mandarin Chinese'],
    correctIndex: 3,
  ),
  Question(
    category: 'Science',
    text: 'What gas do plants absorb from the atmosphere?',
    options: ['Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen'],
    correctIndex: 2,
  ),
  Question(
    category: 'History',
    text: 'Who was the first person to walk on the moon?',
    options: ['Buzz Aldrin', 'Yuri Gagarin', 'Neil Armstrong', 'Alan Shepard'],
    correctIndex: 2,
  ),
  Question(
    category: 'General',
    text: 'How many sides does a hexagon have?',
    options: ['5', '6', '7', '8'],
    correctIndex: 1,
  ),
  Question(
    category: 'Geography',
    text: 'Which is the longest river in the world?',
    options: ['Amazon', 'Nile', 'Yangtze', 'Mississippi'],
    correctIndex: 1,
  ),
  Question(
    category: 'Science',
    text: 'What is the speed of light approximately?',
    options: ['150,000 km/s', '200,000 km/s', '300,000 km/s', '400,000 km/s'],
    correctIndex: 2,
  ),
  Question(
    category: 'History',
    text: 'Which empire was ruled by Julius Caesar?',
    options: ['Greek', 'Ottoman', 'Roman', 'Persian'],
    correctIndex: 2,
  ),
  Question(
    category: 'General',
    text: 'How many hours are in a week?',
    options: ['148', '168', '172', '196'],
    correctIndex: 1,
  ),
  Question(
    category: 'Geography',
    text: 'Which country has the most natural lakes?',
    options: ['Russia', 'USA', 'Brazil', 'Canada'],
    correctIndex: 3,
  ),
  Question(
    category: 'Science',
    text: 'What is the hardest natural substance on Earth?',
    options: ['Gold', 'Iron', 'Diamond', 'Quartz'],
    correctIndex: 2,
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A148C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Quiz\nChallenge',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Test your general knowledge\nacross multiple topics.',
                style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  _StatChip(icon: Icons.quiz_outlined, label: '${questions.length} Questions'),
                  const SizedBox(width: 12),
                  const _StatChip(icon: Icons.category_outlined, label: '4 Topics'),
                ],
              ),
              const Spacer(),
              _CategoryRow(),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuizScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF4A148C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Start Quiz',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}

class _CategoryRow extends StatelessWidget {
  final categories = const [
    {'icon': '🔬', 'label': 'Science'},
    {'icon': '🌍', 'label': 'Geography'},
    {'icon': '📜', 'label': 'History'},
    {'icon': '💡', 'label': 'General'},
  ];

  _CategoryRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map((c) {
        return Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(child: Text(c['icon']!, style: const TextStyle(fontSize: 28))),
            ),
            const SizedBox(height: 6),
            Text(c['label']!, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        );
      }).toList(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _current = 0;
  int _score = 0;
  int? _selected;
  bool _answered = false;

  Question get _question => questions[_current];

  void _selectAnswer(int index) {
    if (_answered) return;
    setState(() {
      _selected = index;
      _answered = true;
      if (index == _question.correctIndex) _score++;
    });
  }

  void _next() {
    if (_current == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(score: _score, total: questions.length),
        ),
      );
    } else {
      setState(() {
        _current++;
        _selected = null;
        _answered = false;
      });
    }
  }

  Color _optionColor(int index) {
    if (!_answered) return Colors.white;
    if (index == _question.correctIndex) return const Color(0xFFE8F5E9);
    if (index == _selected && index != _question.correctIndex) return const Color(0xFFFFEBEE);
    return Colors.white;
  }

  Color _optionBorderColor(int index) {
    if (!_answered) return const Color(0xFFE0E0E0);
    if (index == _question.correctIndex) return Colors.green;
    if (index == _selected && index != _question.correctIndex) return Colors.red;
    return const Color(0xFFE0E0E0);
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_current + 1) / questions.length;
    final isLast = _current == questions.length - 1;

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A148C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              title: const Text('Quit Quiz?', style: TextStyle(fontWeight: FontWeight.w700)),
              content: const Text('Your progress will be lost.'),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: const Text('Continue')),
                TextButton(
                  onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                  child: const Text('Quit', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
        ),
        title: Text(
          'Question ${_current + 1} of ${questions.length}',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Score: $_score',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF4A148C),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                      minHeight: 6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A148C).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _question.category,
                      style: const TextStyle(
                        color: Color(0xFF4A148C),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _question.text,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 28),
                  ...List.generate(_question.options.length, (i) {
                    final isCorrect = i == _question.correctIndex;
                    final isSelected = i == _selected;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: () => _selectAnswer(i),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                          decoration: BoxDecoration(
                            color: _optionColor(i),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: _optionBorderColor(i), width: 1.8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.04),
                                blurRadius: 6,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: _answered
                                      ? (isCorrect
                                          ? Colors.green
                                          : isSelected
                                              ? Colors.red
                                              : Colors.grey[200])
                                      : const Color(0xFF4A148C).withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: _answered && (isCorrect || isSelected)
                                      ? Icon(
                                          isCorrect ? Icons.check : Icons.close,
                                          size: 16,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          ['A', 'B', 'C', 'D'][i],
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: const Color(0xFF4A148C).withOpacity(0.7),
                                          ),
                                        ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Text(
                                  _question.options[i],
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: _answered && isCorrect
                                        ? Colors.green[800]
                                        : _answered && isSelected
                                            ? Colors.red[800]
                                            : const Color(0xFF1A1A1A),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  if (_answered) ...[
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: _selected == _question.correctIndex
                            ? Colors.green[50]
                            : Colors.red[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: _selected == _question.correctIndex
                              ? Colors.green[200]!
                              : Colors.red[200]!,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _selected == _question.correctIndex
                                ? Icons.check_circle
                                : Icons.cancel,
                            color: _selected == _question.correctIndex
                                ? Colors.green
                                : Colors.red,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            _selected == _question.correctIndex
                                ? 'Correct!'
                                : 'Wrong! Correct: ${_question.options[_question.correctIndex]}',
                            style: TextStyle(
                              color: _selected == _question.correctIndex
                                  ? Colors.green[800]
                                  : Colors.red[800],
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _next,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4A148C),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                          elevation: 0,
                        ),
                        child: Text(
                          isLast ? 'See Results' : 'Next Question',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  String get _grade {
    final pct = score / total;
    if (pct >= 0.9) return 'A+';
    if (pct >= 0.8) return 'A';
    if (pct >= 0.7) return 'B';
    if (pct >= 0.6) return 'C';
    return 'D';
  }

  String get _message {
    final pct = score / total;
    if (pct >= 0.9) return 'Outstanding! 🎉';
    if (pct >= 0.7) return 'Well done! 👏';
    if (pct >= 0.5) return 'Good effort! 💪';
    return 'Keep practicing! 📚';
  }

  Color get _gradeColor {
    final pct = score / total;
    if (pct >= 0.7) return Colors.green;
    if (pct >= 0.5) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final percentage = ((score / total) * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFF4A148C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Quiz Complete!',
                style: TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 6),
              Text(
                _message,
                style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 44),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text(
                      _grade,
                      style: TextStyle(
                        fontSize: 72,
                        fontWeight: FontWeight.w800,
                        color: _gradeColor,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Grade',
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                    const SizedBox(height: 28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _ResultStat(label: 'Score', value: '$score / $total'),
                        Container(width: 1, height: 40, color: Colors.grey[200]),
                        _ResultStat(label: 'Percentage', value: '$percentage%'),
                        Container(width: 1, height: 40, color: Colors.grey[200]),
                        _ResultStat(label: 'Wrong', value: '${total - score}'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: score / total,
                        backgroundColor: Colors.grey[200],
                        valueColor: AlwaysStoppedAnimation<Color>(_gradeColor),
                        minHeight: 10,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('0', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        Text('$total', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuizScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF4A148C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    elevation: 0,
                  ),
                  child: const Text('Try Again', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white54),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Home', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultStat extends StatelessWidget {
  final String label;
  final String value;

  const _ResultStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF1A1A1A)),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
      ],
    );
  }
}
