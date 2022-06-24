import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_app/week9/user.dart';

const _sessionKey = '_sessionKey';

class SessionManager {
  SharedPreferences? _sharedPreferences;

  Future<bool> isLoggedIn() async {
    await _initSharedPrefs();
    return _sharedPreferences?.getString(_sessionKey) == null ? false : true;
  }

  Future<void> saveSession(User user) async {
    await _initSharedPrefs();
    await _sharedPreferences?.setString(_sessionKey, user.email);
  }

  Future<void> logout() async {
    await _initSharedPrefs();
    await _sharedPreferences?.remove(_sessionKey);
  }

  Future<String> getCurrentEmail() async {
    await _initSharedPrefs();
    return _sharedPreferences?.getString(_sessionKey) ?? '';
  }

  Future<void> _initSharedPrefs() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }
}