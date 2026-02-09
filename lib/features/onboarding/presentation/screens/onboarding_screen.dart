import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/screens/login_screen.dart';
import 'package:delivery_project/features/auth/presentation/screens/sign_or_login_screen.dart';
import 'package:delivery_project/features/onboarding/data/local.dart';
import 'package:delivery_project/features/onboarding/presentation/widgets/onboarding_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController controller;
  ValueNotifier<int> indexNotifier = ValueNotifier(0);

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 250, 234, 239),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: OnboardingData.data.length,
                controller: controller,
                onPageChanged: (index) => indexNotifier.value = index,
                itemBuilder: (context, index) => OnboardingScreenBody(
                  imagePath: OnboardingData.data[index].imagePath,
                  title: OnboardingData.data[index].title,
                  description: OnboardingData.data[index].description,
                ),
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableBuilder<int>(
                    valueListenable: indexNotifier,
                    builder: (context, index, _) {
                      final bool isLastPage =
                          index == OnboardingData.data.length - 1;
                      return TextButton(
                        onPressed: () async{
                           final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool("onBoardingView", true);

                          if (isLastPage) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignOrLogScreen(),

                              ),
                              (route) => false,
                            );
                          } else {
                            controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: AppColor.primaryColor,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.circle_rounded, size: 10),
                            const SizedBox(width: 6),
                            Text(
                              isLastPage ? 'Get Started' : 'Skip',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
