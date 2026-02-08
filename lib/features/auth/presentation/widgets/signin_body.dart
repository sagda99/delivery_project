import 'package:delivery_project/core/assets/app_color.dart';
import 'package:flutter/material.dart';

class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final ValueNotifier<bool> isChecked = ValueNotifier(false);

    return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
             left: width * 0.04,
              right: width * 0.04,
          ),
          child: Column(
            children: [
              SizedBox(height: height * 0.04),
              //first name
              Form(
                child: Column(
                  children: [
                    //firts name
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
                          hintText: "First Name",
                          prefixIcon: Icon(
                            Icons.person_outlined,
                            color: AppColor.primaryColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    //second name
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
                          hintText: "Second Name",
                          prefixIcon: Icon(
                            Icons.person_outlined,
                            color: AppColor.primaryColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),

                    //phone number
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

                    //email
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
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email_outlined,
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

                    //checkbox
                    SizedBox(height: height * 0.06),

                    ValueListenableBuilder<bool>(
                      valueListenable: isChecked,
                      builder: (context, value, _) {
                        return CheckboxListTile(
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: AppColor.primaryColor,
                          value: value,
                          onChanged: (newValue) {
                            isChecked.value = newValue!;
                          },
                          title: Text(
                            "Yes, I want to receive offers and discounts",
                            style: TextStyle(fontSize: 11),
                          ),
                        );
                      },
                    ),

                    ElevatedButton(
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
                        "Create Account",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.02,),

                    RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 11, color: Colors.black),
                        children: [
                          const TextSpan(text: 'By creating an account you agree to the '),
                          TextSpan(
                            text: 'privacy policy',
                            style: TextStyle(color: AppColor.primaryColor),
                          ),
                          const TextSpan(text: ' and to the\n'),
                          TextSpan(
                            text: 'terms of use',
                            style: TextStyle(color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
