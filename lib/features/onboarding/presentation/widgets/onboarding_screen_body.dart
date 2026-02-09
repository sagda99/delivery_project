import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/core/assets/app_fonts.dart';
import 'package:flutter/material.dart';

class OnboardingScreenBody extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingScreenBody({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 231, 214, 219),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(48.0),
                  bottomLeft: Radius.circular(48.0),
                ),
              ),
              child: Image.asset(imagePath),
            ),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(24),
            color: AppColor.backgrondColor,
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.splashLogoFontfamily,
                    fontSize: AppFonts.onboardingTitleSize,
                    color: AppFonts.onboardingTitleColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFonts.splashLogoFontfamily,
                    fontSize: AppFonts.onboardingDescriptionSize,
                    color: AppFonts.onboardingTitleColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
