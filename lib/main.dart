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
        '/quizz/astronomy': (context) => QuestionnaireWidget(
          imageUrl: 'https://www.aquaportail.com/pictures2311/phones/systeme-solaire.jpg',
          questions: [
            Question(
              questionText: "Mercure est la planète la plus chaude du système solaire",
              isCorrect: false
            ),
            Question(
              questionText: "Une année sur Pluton équivaut à 248 années terrestres",
              isCorrect: true
            ),
            Question(
              questionText: "La Lune s'éloigne progressivement de la Terre chaque année",
              isCorrect: true
            ),
            Question(
              questionText: "Saturne est la seule planète du système solaire à avoir des anneaux",
              isCorrect: false
            ),
            Question(
              questionText: "Le Soleil perdra sa luminosité dans environ 5 milliards d'années",
              isCorrect: true
            ),
          ]
        ),
        '/quizz/cinema': (context) => QuestionnaireWidget(
          imageUrl: 'https://cdn.concreteplayground.com/content/uploads/2020/07/EventCinemas-supplied-1440x1440.jpg',
          questions: [
            Question(
              questionText: "Le film Titanic a remporté 11 Oscars en 1998",
              isCorrect: true
            ),
            Question(
              questionText: "Leonardo DiCaprio a gagné son premier Oscar pour son rôle dans Inception",
              isCorrect: false
            ),
            Question(
              questionText: "Le premier film Star Wars est sorti en 1977",
              isCorrect: true
            ),
            Question(
              questionText: "Le Seigneur des Anneaux a été tourné entièrement en studio",
              isCorrect: false
            ),
            Question(
              questionText: "Avatar est le film le plus rentable de tous les temps",
              isCorrect: true
            ),
          ]
        )
      },
    );
  }
}
