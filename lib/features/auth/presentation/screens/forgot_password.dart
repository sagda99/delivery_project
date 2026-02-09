import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/widgets/forgot_password_body.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  
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
            "Forgotten Password",
            style: TextStyle(
              color: AppColor.authTitleColor,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.09),
          ForgotPasswordBody(),
          
        ],
      ),
    ),
    );
  }
}