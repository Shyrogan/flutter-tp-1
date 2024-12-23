import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tp1/main.dart';
import 'package:tp1/profile.dart';
import 'package:transparent_image/transparent_image.dart';

void main() {
  testWidgets('Checks whether profile displays required informations', (WidgetTester tester) async {
    // On construit notre profil pour le test 
    final testImage = MemoryImage(Uint8List.fromList(kTransparentImage));
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: ProfileWidget(
        displayName: "Hello world",
        description: "Description",
        githubHandle: "GitHub",
        bskyHandle: "shyrogan.bsky.social",
        imageUrl: '',
        imageProvider: testImage,
      ))
    ));

    // On vérifie qu'on arrive bien sur la page de profil
    expect(find.text('Hello world'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
  });
}
