import 'package:delivery_project/features/auth/presentation/widgets/signin_body.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    //final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        // backgroundColor: AppColor.backgrondColor,
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
              "Create an account",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
             Text(
              "Please fill in your accurate information",
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 10),
            ),

            const SigninBody(),
          ],
        ),
      ),
    );
  }
}
