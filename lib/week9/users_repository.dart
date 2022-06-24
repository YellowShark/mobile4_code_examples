import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_app/week9/user.dart';

const _emailKey = '_emailKey';
const _passwordKey = '_passwordKey';

const _users = '_users';

class UsersRepository {
  SharedPreferences? _sharedPreferences;

  Future<void> signUp(User user) async {
    await _initSharedPrefs();
    final json = _sharedPreferences?.getString(_users);
    final it = jsonDecode(json ?? '')['users'];
    final users = json == null ? Users([]) : Users(List<User>.from(it.map((e) => User.fromJson(e))));
    users.users.add(user);
    await _sharedPreferences?.setString(_users, jsonEncode(users.toJson()));

    // await _sharedPreferences?.setString(_emailKey, user.email);
    // await _sharedPreferences?.setString(_passwordKey, user.password);
  }

  Future<bool> contains(User user) async {
    await _initSharedPrefs();
    print(_sharedPreferences?.get(_users));
    final json = _sharedPreferences?.getString(_users);
    final it = jsonDecode(json ?? '')['users'];
    final users = json == null ? Users([]) : Users(List<User>.from(it.map((e) => User.fromJson(e))));
    return users.users.contains(user);

    // final savedEmail = _sharedPreferences?.getString(_emailKey);
    // final savedPassword = _sharedPreferences?.getString(_passwordKey);
    // return user.email == savedEmail && user.password == savedPassword;
  }

  Future<void> _initSharedPrefs() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }
}

class Users {
  List<User> users;

  Users(this.users);

  Users.fromJson(Map<String, dynamic> json) : users = json['users'];

  Map<String, dynamic> toJson() =>
      {
        'users' : users.map((user) => user.toJson()).toList(),
      };
}
