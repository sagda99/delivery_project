import 'package:delivery_project/core/themes/app_duration.dart';
import 'package:delivery_project/features/auth/presentation/screens/sign_or_login_screen.dart';
import 'package:delivery_project/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:delivery_project/features/splash/presentation/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkOnboarding(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreenBody();
          }

          if (snapshot.hasData) {
            if (snapshot.data == false) {
              return const OnboardingScreen();
            } else {
              return const SignOrLogScreen();
            }
          }

          return const SplashScreenBody();
        },
      ),
    );
  }
}

Future<bool> checkOnboarding() async {
  await Future.delayed(const Duration(seconds: AppDuration.duration));
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('onBoardingView') ?? false;
}
