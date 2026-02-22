import 'package:delivery_project/core/services/pref_services.dart';
import 'package:delivery_project/features/onboarding/data/model/user_model.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final PrefsService _prefs = PrefsService();

  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;

  Future<void> loadUserFromPrefs() async {
    _user = await _prefs.loadUser();
    notifyListeners();
  }

  Future<bool> register(UserModel user) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _prefs.saveUser(user);
      _user = user;
      return true;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateName(String firstName, String lastName) async {
    if (_user == null) return;

    final updateUser = UserModel(
      firstName: firstName,
      lastName: lastName,
      email: _user!.email,
      phone: _user!.phone,
    );
    await _prefs.saveUser(updateUser);
    _user = updateUser;
    notifyListeners();
  }

  Future<void> logout() async {
    await _prefs.clearUser();
    _user = null;
    notifyListeners();
  }
}
