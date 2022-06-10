import 'package:flutter/material.dart';
import 'package:widgets_app/details_page.dart';
import 'package:widgets_app/splash_screen.dart';
import 'package:widgets_app/lottie_sample.dart';

import 'home_page.dart';

void main() {
  var a = A(1);
  a.b = 1;
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
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/home': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
      },
    );
  }
}

class A {
  @protected
  int b;

  A(this.b);
}