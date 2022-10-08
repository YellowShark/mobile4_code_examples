import 'package:flutter/material.dart';
import 'package:flutter_notifications/ui/notes/notes_page.dart';

import 'di/config.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotesPage(),
    );
  }
}