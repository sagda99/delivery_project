import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/widgets/create_new_password_body.dart';
import 'package:flutter/material.dart';

class CreateNewPassword extends StatelessWidget {
  const CreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    //final width = MediaQuery.sizeOf(context).width;

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
        centerTitle: true,
        title: const Text(
          'Welcome to La bouffe',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            Text(
              "Create New Password",
              style: TextStyle(
                color: AppColor.authTitleColor,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Please enter a case sensitive password",
              style: TextStyle(color: AppColor.authTitleColor, fontSize: 10),
            ),

            SizedBox(height: height * 0.04),

            CreateNewPasswordBody(),
          ],
        ),
      ),
    );
  }
}
