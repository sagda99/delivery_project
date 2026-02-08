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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('Welcome to La bouffe',
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600)),
      ),
      body: Center(
      child: Column(
        children: [
          SizedBox(height: height * 0.04),
          Text(
            "Create an account",
            style: TextStyle(
              color: Color(0xff484646),
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Please fill in your accurate information",
            style: TextStyle(color: Color(0xff484646), fontSize: 10),
          ),
          
          SigninBody(),
        ],
      ),
    ),
    );
  }
}
