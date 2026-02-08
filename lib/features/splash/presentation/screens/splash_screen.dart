import 'package:delivery_project/core/themes/app_duration.dart';
import 'package:delivery_project/features/auth/presentation/screens/login_screen.dart';
import 'package:delivery_project/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:delivery_project/features/onboarding/presentation/widgets/onboarding_screen_body.dart';
import 'package:delivery_project/features/splash/presentation/widgets/splash_screen_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(const Duration(seconds: AppDuration.duration)),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return SplashScreenBody();
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          );
        });

          return SplashScreenBody();
        },
      ),
    );
  }
}
// Future<bool> checkOnboarding() async {
//   await Future.delayed(const Duration(seconds: 1));
//   final prefs = await SharedPreferences.getInstance();
//     bool devMode = true;
//   if (devMode) return false;

//   return prefs.getBool('onBoardingView') ?? false;
// }
