import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/widgets/login_screen_body.dart';
import 'package:delivery_project/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgrondColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgrondColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            Text(
              "Welcome Back!",
              style: TextStyle(
                color: AppColor.authTitleColor,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Please fill in your accurate information",
              style: TextStyle(color: AppColor.authTitleColor, fontSize: 10),
            ),
            SizedBox(height: height * 0.09),
            LoginScreenBody(),
          ],
        ),
      ),
    );
  }
}
