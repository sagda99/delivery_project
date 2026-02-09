import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({super.key});

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  late final width = MediaQuery.sizeOf(context).width;
  late final height = MediaQuery.sizeOf(context).height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColor.backgrondColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10, // blur
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Email/Phone number",
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            "An OTP Code will be sent to you to complete this action",
            style: TextStyle(color: Color(0xff484646), fontSize: 12),
          ),

          SizedBox(height: 120),

          SizedBox(
            width: 500,
            height: height * 0.07,
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
                  MaterialPageRoute(builder: (_) => OtpScreen()),
                );
              },
              child: const Text(
                "Reset your password",
                style: TextStyle(
                  color: AppColor.backgrondColor,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
