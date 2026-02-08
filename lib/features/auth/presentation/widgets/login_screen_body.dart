import 'package:delivery_project/core/assets/app_assets.dart';
import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/screens/forgot_password.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  late final width = MediaQuery.sizeOf(context).width;
  late final height = MediaQuery.sizeOf(context).height;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: width * 0.04,
          right: width * 0.04,
        ),

        //PHONE NUMBER
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                  hintText: "phone number",
                  prefixIcon: Icon(
                    Icons.phone_outlined,
                    color: AppColor.primaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            //password
           Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: AppColor.primaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),

            SizedBox(height: 100),

           SizedBox(
            width: 500,
            height: height * 0.07,
            child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Placeholder()),
                );
              },
              child: const Text(
                "Log in",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
           ),
           Align(
            alignment: Alignment.centerRight,
            child: TextButton(
            onPressed: (){
              Navigator.push(
                context,
                 MaterialPageRoute(builder: (_) => const ForgotPassword()));
            },
             child: Text("Forgot password?",
             style: TextStyle(color: Color.fromARGB(255, 141, 137, 137)),
             )
             ),
           ),

           SizedBox(height: height * 0.15),
          const Text(
            "Connect With",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAssets.facebook,
              SizedBox(width: width * 0.05),
              AppAssets.apple,
              SizedBox(width: width * 0.05),
              AppAssets.google,
            ],
          ),
          ],
        ),
        ),
    );
  }
}