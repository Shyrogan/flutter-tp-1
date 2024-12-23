import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Question {
  String questionText;
  bool isCorrect;

  Question({
    required this.questionText,
    required this.isCorrect
  });
}

class QuestionnaireState extends State<QuestionnaireWidget> {
  late Question _currentQuestion;

  QuestionnaireState();

  @override
  void initState() {
    super.initState();
    _currentQuestion = widget.questions.first;
  }

  void _next() {
    setState(() {
      _currentQuestion = widget.questions[(widget.questions.indexOf(_currentQuestion) + 1) % widget.questions.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Question aléatoire")
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: widget.imageUrl != null ? NetworkImage(widget.imageUrl!) : MemoryImage(kTransparentImage),
                  backgroundColor: Colors.grey.shade200,
                ),
                const SizedBox(height: 8),
                Text(
                  _currentQuestion.questionText,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text("Vrai"),
                  onPressed: () => {
                    if (_currentQuestion.isCorrect) _next()
                  }
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text("Faux"),
                  onPressed: () => {
                    if (!_currentQuestion.isCorrect) _next()
                  }
                )
              ],
            )
          )
        )
      )
    );
  }
}

class QuestionnaireWidget extends StatefulWidget {
  final String? imageUrl;
  final List<Question> questions;

  const QuestionnaireWidget({ super.key, required this.questions, this.imageUrl });

  @override
  State<StatefulWidget> createState() => QuestionnaireState();
}
