// ignore_for_file: avoid_print

import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/widgets/validation.dart';
import 'package:delivery_project/features/home/presentation/screens/home_screen.dart';
import 'package:delivery_project/features/onboarding/data/model/user_model.dart';
import 'package:delivery_project/features/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  final _keyForm = GlobalKey<FormState>();
  final ValueNotifier<bool> isChecked = ValueNotifier(false);
  final ValueNotifier<bool> isObsecure = ValueNotifier(true);

  late final TextEditingController firstNameController;
  late final TextEditingController secondNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;

  static const int _maxNameLength = 20;

  @override
  void initState() {
    firstNameController = TextEditingController();
    secondNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    emailController.dispose();
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
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        child: Column(
          children: [
            SizedBox(height: height * 0.04),
            //first name
            Form(
              key: _keyForm,
              child: Column(
                children: [
                  //firts name
                  _buildTextField(
                    controller: firstNameController,
                    hintText: "First Name",
                    icon: Icons.person_outlined,
                    validator: Validation.validateName,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(_maxNameLength),
                    ],
                  ),
                  SizedBox(height: height * 0.02),

                  //second name
                  _buildTextField(
                    controller: secondNameController,
                    hintText: "Second Name",
                    icon: Icons.person_outlined,
                    validator: Validation.validateName,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(_maxNameLength),
                    ],
                  ),
                  SizedBox(height: height * 0.02),

                  //phone number
                  _buildTextField(
                    controller: phoneController,
                    hintText: "Phone Number",
                    icon: Icons.phone_outlined,
                    validator: Validation.vaildatePhone,
                    keyboardType: TextInputType.phone,
                  ),

                  SizedBox(height: height * 0.02),

                  //email
                  _buildTextField(
                    controller: emailController,
                    hintText: "Email",
                    icon: Icons.email_outlined,
                    validator: Validation.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height * 0.02),

                  //password
                  // space validation
                  ValueListenableBuilder(
                    valueListenable: isObsecure,
                    builder: (context, value, child) {
                      return _buildTextField(
                        controller: passwordController,
                        hintText: "Password",
                        icon: Icons.lock_outlined,
                        inputFormatters: [
                          // don't allow user to add space
                          FilteringTextInputFormatter.deny(RegExp(r'\s')),
                        ],
                        validator: Validation.validatePassword,
                        obscureText: value,
                        suffixIcon: IconButton(
                          onPressed: () => isObsecure.value = !value,
                          icon: Icon(
                            value ? Icons.visibility_off : Icons.visibility,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      );
                    },
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
                        title: const Text(
                          "Yes, I want to receive offers and discounts",
                          style: TextStyle(fontSize: 11),
                        ),
                      );
                    },
                  ),

                  ElevatedButton(
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
                    onPressed: () async {
                      if (_keyForm.currentState!.validate()) {
                        final user = UserModel(
                          firstName: firstNameController.text.trim(),
                          lastName: secondNameController.text.trim(),
                          email: emailController.text.trim(),
                          phone: phoneController.text.trim(),
                        );
                         final success = await context.read<AuthProvider>().register(user);

                        if (success && context.mounted) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const HomeScreen()),
                            (route) => false,
                          );
                        }
                      }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => const Placeholder()),
                      // );
                    },
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: AppColor.backgrondColor,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      children: [
                        const TextSpan(
                          text: 'By creating an account you agree to the ',
                        ),
                        const TextSpan(
                          text: 'privacy policy',
                          style: TextStyle(color: AppColor.primaryColor),
                        ),
                        const TextSpan(text: ' and to the\n'),
                        const TextSpan(
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
