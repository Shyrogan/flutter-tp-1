import 'dart:math';

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
        '/random': (context) => questionsDataSet[Random().nextInt(questionsDataSet.length)]
      },
    );
  }
}
