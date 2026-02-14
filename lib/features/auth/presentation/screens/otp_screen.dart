import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/widgets/otp_body.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgrondColor,
      appBar: AppBar(backgroundColor: AppColor.backgrondColor),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            const Text(
              "Enter your OTP",
              style: TextStyle(
                color: AppColor.authTitleColor,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "An OTP Code will be sent to you to complete this action",
              style: TextStyle(color: AppColor.authTitleColor, fontSize: 10),
            ),
            SizedBox(height: height * 0.09),
            const OtpBody(),
          ],
        ),
      ),
    );
  }
}
