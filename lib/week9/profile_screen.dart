import 'package:flutter/material.dart';
import 'package:widgets_app/week9/session_manager.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final SessionManager _sessionManager = SessionManager();

  String username = '';

  @override
  void initState() {
    super.initState();
    _initUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
            onPressed: () async {
              await _sessionManager.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Hello, $username!')),
        ],
      ),
    );
  }

  Future<void> _initUsername() async {
    final email = await _sessionManager.getCurrentEmail();
    setState(() {
      username = email;
    });
  }
}
