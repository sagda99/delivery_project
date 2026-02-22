import 'package:delivery_project/features/providers/theme_provider.dart';
import 'package:delivery_project/core/themes/prefs/style.dart';
import 'package:delivery_project/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: Style.themeData(themeProvider.darkTheme),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        );
      },
    );
  }
}


