import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_example/firebase_options.dart';
import 'package:flutter_firebase_example/profile_screen.dart';
import 'package:flutter_firebase_example/sign_up_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'login_screen.dart';

const key = "pk_test_51LeF4gIqnS8d6yUMeqB0UewwX83GlmUNNf7E9n6TNka6R4O9S9blN2wap1YJEB8Y1joFtG9Y1v0Jono4HJ2XIqPh00sQWysObI";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = key;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: '/profile',
      routes: {
        '/login': (_) => LoginScreen(),
        '/sign_up': (_) => SignUpScreen(),
        '/profile': (_) => const ProfileScreen(),
      },
    );
  }
}
