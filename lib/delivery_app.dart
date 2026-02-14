import 'package:delivery_project/core/themes/light/ligth_mode.dart';
import 'package:delivery_project/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: lightMode(),
      home: const SplashScreen(),
    );
  }
}
