import 'package:delivery_project/core/assets/app_color.dart';
import 'package:flutter/material.dart';

ThemeData lightMode() {
  return ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      // backgroundColor: AppColor.primaryColor,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
    ),
  );
}
