import 'package:flutter/material.dart';
import 'package:widgets_app/week8/di/config.dart';
import 'package:widgets_app/week8/ui/home/home_screen_bloc.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (_) => const RecipesScreenWithBloc(),
      },
    );
  }
}