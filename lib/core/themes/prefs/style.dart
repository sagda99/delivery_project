// ignore_for_file: deprecated_member_use

import 'package:delivery_project/core/assets/app_color.dart';
import 'package:flutter/material.dart';

class Style {
  static ThemeData themeData(bool isDarkTheme) {
    return ThemeData(
      primaryColor: isDarkTheme ? AppColor.primaryColor : Colors.white,
      scaffoldBackgroundColor: isDarkTheme ? const Color.fromARGB(255, 24, 24, 24) : Colors.white,
      colorScheme: ColorScheme(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      primary: isDarkTheme ? Colors.white : Colors.black,
      onPrimary: isDarkTheme ? Colors.black : Colors.white,
      secondary: isDarkTheme ? Colors.white70 : Colors.black87,
      onSecondary: isDarkTheme ? Colors.black : Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: isDarkTheme ? Colors.black : Colors.white,
      onSurface: isDarkTheme ? Colors.white : Colors.black,
       // ✅ controls text/icon colors
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: isDarkTheme ? const Color.fromARGB(255, 43, 43, 43) : Colors.white,
      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.white : Colors.grey[900],
      ),
      titleTextStyle: TextStyle(
        color: isDarkTheme ? Colors.white : Colors.grey[900],
      ),
    ),
      inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isDarkTheme ? Colors.grey[900] : Colors.grey[200],
      hintStyle: TextStyle(
        color: isDarkTheme ? Colors.white54 : Colors.black45,
      ),
    ),
    iconTheme: IconThemeData(
      color: isDarkTheme ? const Color.fromARGB(255, 233, 69, 20) : AppColor.primaryColor,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColor.primaryColor),
      trackColor: MaterialStateProperty.all(AppColor.primaryColor.withOpacity(0.5)),
    ),
    );
  }
}