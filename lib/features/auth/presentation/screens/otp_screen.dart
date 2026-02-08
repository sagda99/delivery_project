import 'package:delivery_project/features/auth/presentation/widgets/otp_body.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

     return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
            "Enter your OTP",
            style: TextStyle(
              color: Color(0xff484646),
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "An OTP Code will be sent to you to complete this action",
            style: TextStyle(color: Color(0xff484646), fontSize: 10),
          ),
          SizedBox(height: height * 0.09),
          OtpBody(),
          
        ],
      ),
      ),
    );
  }

}