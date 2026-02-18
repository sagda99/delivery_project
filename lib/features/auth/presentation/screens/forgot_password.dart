import 'package:delivery_project/features/auth/presentation/widgets/forgot_password_body.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        title: const Text(
          "Forgotten Password",
          style: TextStyle(
            // color: AppColor.authTitleColor,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            const ForgotPasswordBody(),
          ],
        ),
      ),
    );
  }
}
