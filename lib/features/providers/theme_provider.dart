import 'package:delivery_project/core/services/pref_themes.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _darkTheme = false;
  ThemePreference preference = ThemePreference();

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    preference.setTheme(value);
    notifyListeners();
  }
}
