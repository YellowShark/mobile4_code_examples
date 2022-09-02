import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_firebase_example/singleton.dart';

class FirebaseHelper {
  static Future<bool> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'user-not-found') {
        print("Unknown user");
      } else if (e.code == 'wrong-password') {
        print("Wrong password");
      }
    } catch (e) {
      print("Unknown error");
    }
    return false;
  }

  static Future<bool> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        print('Invalid email address.');
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: 'danil.dobrodeev@mail.ru');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/invalid-email') {
        print('Invalid email.');
      }
      print(e);
    }
  }

  static Future<void> write(String note) async {
    final id = FirebaseAuth.instance.currentUser?.uid;
    if (id == null) return;
    final ref = FirebaseDatabase.instance.ref("notes/$id");
    await ref.push().set(note);
  }

  static Stream<DatabaseEvent> getNotes() {
    final id = FirebaseAuth.instance.currentUser?.uid;
    if (id == null) return const Stream.empty();
    final ref = FirebaseDatabase.instance.ref("notes/$id");
    return ref.onValue;
  }

  static Future<void> writeMessage(String message) async {
    final ref = FirebaseDatabase.instance.ref("message");
    await ref.set(message);
  }

  static Stream<DatabaseEvent> readMessage() => FirebaseDatabase.instance.ref("message").onValue;
}
