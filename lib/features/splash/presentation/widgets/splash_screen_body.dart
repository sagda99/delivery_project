import 'package:delivery_project/core/assets/app_assets.dart';
import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/core/assets/app_fonts.dart';
import 'package:flutter/material.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({super.key});

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets.logo,
            Text(
              "La bouffe",
              style: TextStyle(
                fontFamily: AppFonts.splashLogoFontfamily,
                fontWeight: FontWeight.w400,
                fontSize: AppFonts.splashLogoFontSize,
                color: AppFonts.splashLogoFontColor,
              ),
            ),
            Text(
              "Our goal is your Satisfaction",
              style: TextStyle(
                fontFamily: AppFonts.splashLogoFontfamily,
                fontWeight: FontWeight.w200,
                fontSize: AppFonts.splashDescriptionFontSize,
                color: AppFonts.splashLogoFontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}