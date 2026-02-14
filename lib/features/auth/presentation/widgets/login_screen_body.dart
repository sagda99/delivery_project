import 'package:delivery_project/core/assets/app_assets.dart';
import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/screens/forgot_password.dart';
import 'package:delivery_project/features/auth/presentation/widgets/validation.dart';
import 'package:delivery_project/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show TextInputFormatter;

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  late final width = MediaQuery.sizeOf(context).width;
  late final height = MediaQuery.sizeOf(context).height;

  final _keyForm = GlobalKey<FormState>();

  late final TextEditingController phoneController;
  late final TextEditingController passwordController;

  final ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  BoxDecoration _inputDecoration() {
    return BoxDecoration(
      color: AppColor.backgrondColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          // ignore: deprecated_member_use
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required String? Function(String?) validator,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: _inputDecoration(),
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction ?? TextInputAction.next,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: AppColor.primaryColor),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),

        //PHONE NUMBER
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              //password

              // space validation
              _buildTextField(
                controller: phoneController,
                hintText: "Phone Number",
                icon: Icons.phone_outlined,
                validator: Validation.vaildatePhone,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: height * 0.02),

              //password
              ValueListenableBuilder(
                valueListenable: isObscure,
                builder: (context, value, child) {
                  return _buildTextField(
                    controller: passwordController,
                    hintText: "Password",
                    icon: Icons.lock_outlined,
                    validator: Validation.validatePassword,
                    obscureText: value,
                    suffixIcon: IconButton(
                      onPressed: () => isObscure.value = !value,
                      icon: Icon(
                        value ? Icons.visibility_off : Icons.visibility,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 100),

              SizedBox(
                width: double.infinity,
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
                    if (_keyForm.currentState!.validate()) {
                      print("forn is valid");
                    }
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      color: AppColor.backgrondColor,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ForgotPassword()),
                    );
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Color.fromARGB(255, 141, 137, 137)),
                  ),
                ),
              ),

              SizedBox(height: height * 0.15),
              const Text("Connect With", style: TextStyle(color: Colors.black)),
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
      ),
    );
  }
}
