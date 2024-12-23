import 'package:flutter/material.dart';

const questionsDataSet = [
  QuestionWidget(question: "Est-ce que Dart/Flutter est agréable à utiliser ?", isRight: true),
  QuestionWidget(question: "Le langage C est-il orienté objet ?", isRight: false),
  QuestionWidget(question: "HTML est-il un langage de programmation ?", isRight: false),
  QuestionWidget(question: "Le polymorphisme est-il un concept de la programmation orientée objet ?", isRight: true),
  QuestionWidget(question: "Les bases de données NoSQL utilisent-elles des tables ?", isRight: false),
  QuestionWidget(question: "Est-ce que JavaScript peut être exécuté côté serveur ?", isRight: true),
  QuestionWidget(question: "Python utilise-t-il l'indentation pour structurer son code ?", isRight: true),
  QuestionWidget(question: "TCP garantit-il la livraison des paquets ?", isRight: true),
  QuestionWidget(question: "CSS signifie-t-il 'Cascading Style Sheets' ?", isRight: true),
  QuestionWidget(question: "Le protocole HTTPS est-il plus sécurisé que HTTP ?", isRight: true),
];

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    super.key,
    required this.question,
    required this.isRight,
    this.imageLink
  });

  final String question;
  final bool isRight;
  final String? imageLink;

  void _next(BuildContext context) {
    Navigator.of(context).pushNamed('/random');
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
                Text(
                  question,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text("Vrai"),
                  onPressed: () => {
                    if (isRight) _next(context)
                  }
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  child: const Text("Faux"),
                  onPressed: () => {
                    if (!isRight) _next(context)
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
