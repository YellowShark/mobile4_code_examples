import 'package:flutter/material.dart';
import 'package:widgets_app/week9/session_manager.dart';
import 'package:widgets_app/week9/user.dart';
import 'package:widgets_app/week9/users_repository.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _usersRepository = UsersRepository();
  final _sessionManager = SessionManager();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: 'email'),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(hintText: 'password'),
            obscureText: true,
            textInputAction: TextInputAction.done,
          ),
          ElevatedButton(
            onPressed: () async {
              final email = _emailController.text;
              final password = _passwordController.text;
              final user = User(email, password, '');
              if (await _usersRepository.contains(user)) {
                await _sessionManager.saveSession(user);
                Navigator.pushReplacementNamed(context, '/home', arguments: email);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Wrong email or password'),
                  ),
                );
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/sign_up');
            },
            child: const Text('Firstly here? Sign up!'),
          ),
        ],
      ),
    );
  }
}
