import 'package:flutter/material.dart';
import 'package:flutter_firebase_example/firebase_helper.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
              final success = await FirebaseHelper.login(email, password);
              if (success) {
                Navigator.pushReplacementNamed(context, '/profile');
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
          TextButton(
            onPressed: () => FirebaseHelper.resetPassword(),
            child: const Text('Reset password.'),
          ),
        ],
      ),
    );
  }
}