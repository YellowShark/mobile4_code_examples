import 'package:flutter/material.dart';
import 'package:widgets_app/week9/login_screen.dart';
import 'package:widgets_app/week9/profile_screen.dart';
import 'package:widgets_app/week9/session_manager.dart';
import 'package:widgets_app/week9/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sessionManager = SessionManager();
  final initialRoute = await sessionManager.isLoggedIn() ? '/home' : '/login';
  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: initialRoute,
      routes: {
        '/login': (_) => LoginScreen(),
        '/sign_up': (_) => SignUpScreen(),
        '/home': (_) => ProfileScreen(),
      },
    );
  }
}
