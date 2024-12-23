import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tp1/question.dart';

void main() {
  testWidgets('Checks whether profile displays required informations', (WidgetTester tester) async {
    // On construit notre profil pour le test 
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: questionsDataSet.first)
    ));

    // On vérifie qu'on arrive bien sur la page de profil
    expect(find.text('Est-ce que Dart/Flutter est agréable à utiliser ?'), findsOneWidget);
  });
}
