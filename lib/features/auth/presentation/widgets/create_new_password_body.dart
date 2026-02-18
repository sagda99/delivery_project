// ignore_for_file: avoid_print

import 'package:delivery_project/core/assets/app_assets.dart';
import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/widgets/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateNewPasswordBody extends StatefulWidget {
  const CreateNewPasswordBody({super.key});

  @override
  State<CreateNewPasswordBody> createState() => _CreateNewPasswordBodyState();
}

class _CreateNewPasswordBodyState extends State<CreateNewPasswordBody> {
  late final width = MediaQuery.sizeOf(context).width;
  late final height = MediaQuery.sizeOf(context).height;

  final _keyForm = GlobalKey<FormState>();

  late final TextEditingController passwordController;
  late final TextEditingController passwordConfirmController;

  final ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isObscureConfirm = ValueNotifier<bool>(true);

  @override
  void initState() {
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    passwordConfirmController.dispose();
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
              ValueListenableBuilder(
                valueListenable: isObscure,
                builder: (context, value, child) {
                  return _buildTextField(
                    controller: passwordController,
                    hintText: "New Password",
                    icon: Icons.lock_outlined,
                    validator: Validation.validatePassword,
                    inputFormatters: [
                          // don't allow user to add space
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
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

              SizedBox(height: height * 0.02),

              //confirm password
              ValueListenableBuilder(
                valueListenable: isObscureConfirm,
                builder: (context, value, child) {
                  return _buildTextField(
                    controller: passwordConfirmController,
                    inputFormatters: [
                          // don't allow user to add space
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                    hintText: "Confirm your new Password",
                    icon: Icons.lock_outlined,
                    validator: (value) => Validation.validateConfirmPassword(
                      value,
                      passwordController.text,
                    ),
                    obscureText: value,
                    suffixIcon: IconButton(
                      onPressed: () => isObscureConfirm.value = !value,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Placeholder()),
                    );
                  },
                  child: const Text(
                    "sign in",
                    style: TextStyle(
                      color: AppColor.backgrondColor,
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.15),
              const Text("Connect With",),
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
