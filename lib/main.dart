import 'package:flutter/material.dart';
import 'package:tp1/profile.dart';
import 'package:tp1/question.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const ProfileWidget(
            displayName: 'Sébastien VIAL',
            description: 'Étudiant en M2 Génie Logiciel',
            imageUrl: 'https://avatars.githubusercontent.com/u/24733746?v=4',
            bskyHandle: 'shyrogan.bsky.social',
            githubHandle: 'Shyrogan',
          ),
        '/quizz': (context) => QuestionnaireWidget(
          questions: [
            Question(
              questionText: "La Tour Eiffel mesure exactement 324 mètres de hauteur",
              isCorrect: true
            ),
            Question(
              questionText: "Le Soleil tourne autour de la Terre",
              isCorrect: false
            ),
            Question(
              questionText: "L'eau bout toujours à 100 degrés Celsius",
              isCorrect: false
            ),
            Question(
              questionText: "La Grande Muraille de Chine est visible depuis l'espace",
              isCorrect: false
            ),
            Question(
              questionText: "Le diamant est la forme la plus dure du carbone",
              isCorrect: true
            ),
            Question(
              questionText: "Mozart est mort avant ses 40 ans",
              isCorrect: true
            ),
            Question(
              questionText: "Les autruches mettent leur tête dans le sable quand elles ont peur",
              isCorrect: false
            ),
            Question(
              questionText: "Le corps humain contient plus de bactéries que de cellules",
              isCorrect: true
            ),
            Question(
              questionText: "Vincent van Gogh n'a vendu qu'un seul tableau de son vivant",
              isCorrect: true
            ),
            Question(
              questionText: "Les chauves-souris sont aveugles",
              isCorrect: false
            ),
          ]
        ) 
      },
    );
  }
}
