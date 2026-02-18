import 'package:delivery_project/features/auth/presentation/widgets/login_screen_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        // backgroundColor: AppColor.backgrondColor
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            const Text(
              "Welcome Back!",
              style: TextStyle(
                // color: AppColor.authTitleColor,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Please fill in your accurate information",
              style: TextStyle( fontSize: 10),
            ),
            SizedBox(height: height * 0.09),
            const LoginScreenBody(),
          ],
        ),
      ),
    );
  }
}
