import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_example/firebase_helper.dart';
import 'package:flutter_firebase_example/stripe_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var username = '';
  var notes = <String>[];
  var message = '';
  var proMode = false;

  @override
  void initState() {
    super.initState();
    _initUsername();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseHelper.logout();
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
        children: [
          const SizedBox(height: 24),
          Center(child: Text('Hello, $username!')),
          if (proMode) ..._notes() else _payment(),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              _showDialog();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _showMsgDialog();
            },
            child: const Icon(Icons.message),
          ),
        ],
      ),
    );
  }

  Future<void> _initUsername() async {
    final email = FirebaseAuth.instance.currentUser?.email ?? '';
    setState(() {
      username = email;
    });
  }

  Future _showDialog() => showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) {
          final nameController = TextEditingController();
          return AlertDialog(
            title: const Text('New note'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  final note = nameController.text;
                  FirebaseHelper.write(note);
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              )
            ],
          );
        },
      );

  Future _initData() async {
    FirebaseHelper.getNotes().listen((event) {
      final map = event.snapshot.value as Map<dynamic, dynamic>?;
      if (map != null) {
        setState(() {
          notes = map.values.map((e) => e as String).toList();
        });
      }
    });

    FirebaseHelper.readMessage().listen((event) {
      final value = event.snapshot.value as String?;
      if (value != null) {
        setState(() {
          message = value;
        });
      }
    });
    final isPro = await FirebaseHelper.isProMode();
    setState(() {
      proMode = isPro;
    });
  }

  void _showMsgDialog() => showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) {
          final messageController = TextEditingController();
          return AlertDialog(
            title: const Text('New message'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: messageController,
                  decoration: const InputDecoration(hintText: 'Message'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  final message = messageController.text;
                  FirebaseHelper.writeMessage(message);
                  Navigator.pop(context);
                },
                child: const Text('Send'),
              )
            ],
          );
        },
      );

  List<Widget> _notes() => [
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(notes[i]),
              onTap: () => FirebaseHelper.removeNote(notes[i]),
            ),
          ),
        )
      ];

  Widget _payment() {
    return ElevatedButton(
      onPressed: () {
        StripeHelper.initPaymentSheet(
            email: FirebaseAuth.instance.currentUser?.email ?? 'example@gmail.com',
            amount: 500,
            onSuccess: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Payment completed!')),
              );
              await FirebaseHelper.enableProMode();
              setState(() {
                proMode = true;
              });
            },
            onError: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error)),
              );
            });
      },
      child: const Text('Subscription'),
    );
  }
}
