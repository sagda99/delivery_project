import 'package:delivery_project/core/assets/app_assets.dart';
import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/core/assets/app_fonts.dart';
import 'package:delivery_project/features/auth/presentation/widgets/sign_or_log_body.dart';
import 'package:flutter/material.dart';

class SignOrLogScreen extends StatelessWidget {
  const SignOrLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      backgroundColor: AppColor.primaryColor,
      body: Column(
        children: [
          SizedBox(height: height * 0.15),
          AppAssets.logo,
          const Text(
            "La bouffe",
            style: TextStyle(
              fontFamily: AppFonts.splashLogoFontfamily,
              fontWeight: FontWeight.w400,
              fontSize: AppFonts.splashLogoFontSize,
              color: AppFonts.splashLogoFontColor,
            ),
          ),
          const Text(
            "Our goal is your Satisfaction",
            style: TextStyle(
              fontFamily: AppFonts.splashLogoFontfamily,
              fontWeight: FontWeight.w200,
              fontSize: AppFonts.splashDescriptionFontSize,
              color: AppFonts.splashLogoFontColor,
            ),
          ),
          const SizedBox(height: 48),
          const Expanded(child: SignOrLogScreenBody()),
        ],
      ),
    );
  }
}
