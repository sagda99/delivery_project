import 'package:delivery_project/features/onboarding/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const _keys = ['firstName', 'lastName', 'email', 'phone'];

  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final map = user.toMap();
    for (final key in _keys) {
      await prefs.setString(key, map[key]!);
    }
  }

  Future<UserModel?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    // Return null if no user has been saved yet
    if (!prefs.containsKey('firstName')) return null;
    return UserModel.fromMap({
      for (final key in _keys) key: prefs.getString(key),
    });
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    for (final key in _keys) {
      await prefs.remove(key);
    }
  }
}