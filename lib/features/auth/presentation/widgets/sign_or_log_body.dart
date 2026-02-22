import 'package:delivery_project/core/assets/app_assets.dart';
import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/screens/login_screen.dart';
import 'package:delivery_project/features/auth/presentation/screens/create_account_screen.dart';
import 'package:flutter/material.dart';

class SignOrLogScreenBody extends StatelessWidget {
  const SignOrLogScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      decoration:  BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: width * 0.7,
            height: height * 0.08,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Signin()),
                );
              },
              child: const Text(
                "Create Account",
                style: TextStyle(
                  color: AppColor.backgrondColor,
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: width * 0.7,
            height: height * 0.08,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.loginButtonColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text(
                "Log in",
                style: TextStyle(
                  color: AppColor.backgrondColor,
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.15),
          const Text("Connect With",),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAssets.facebook,
              SizedBox(width: width * 0.05),
              AppAssets.apple,
              SizedBox(width: width * 0.05),
              AppAssets.google,
            ],
          ),
        ],
      ),
    );
  }
}
