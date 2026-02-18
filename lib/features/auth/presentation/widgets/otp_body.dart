// ignore_for_file: avoid_print

import 'package:delivery_project/core/assets/app_color.dart';
import 'package:delivery_project/features/auth/presentation/widgets/alert_dialog_body.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pinput/pinput.dart';

class OtpBody extends StatefulWidget {
  const OtpBody({super.key});

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  late final height = MediaQuery.sizeOf(context).height;
  late Timer _timer;
  int _seconds = 30;

  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
    startTimer();
  }

  void startTimer() {
    _seconds = 59;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        child: Column(
          children: [
            Pinput(
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              enableInteractiveSelection: true,
              controller: controller,
              keyboardType: TextInputType.number,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),

              validator: (value) {
                if (value == null || value.isEmpty || value.length < 4) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter a valid OTP")),
                  );
                }
                return null;
              },
              focusedPinTheme: PinTheme(
                height: 75,
                width: 75,
                textStyle: const TextStyle(),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primaryColor),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              submittedPinTheme: PinTheme(
                height: 60,
                width: 55,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.loginButtonColor),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              length: 4,
            ),

            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 SizedBox(
            //                   height: 68,
            //                   width: 64,
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                       color: Colors.grey.shade200,
            //                       borderRadius: BorderRadius.circular(12),
            //                     ),
            //                     alignment: Alignment.center,
            //                     child: TextFormField(
            //                       onChanged: (value) {
            //                         if (value.length == 1) {
            //                           FocusScope.of(context).nextFocus();
            //                         }
            //                       },
            //                       keyboardType: TextInputType.number,
            //                       textAlign: TextAlign.center,
            //                       style: Theme.of(context).textTheme.headlineMedium,
            //                       inputFormatters: [
            //                         LengthLimitingTextInputFormatter(1),
            //                         FilteringTextInputFormatter.digitsOnly,
            //                       ],
            //                       decoration: const InputDecoration(
            //                         border: InputBorder.none,
            //                         counterText: "",
            //                         hintText: "*",
            //                         hintStyle: TextStyle(color: AppColor.primaryColor),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //
            //                 SizedBox(
            //                   height: 68,
            //                   width: 64,
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                       color: Colors.grey.shade200,
            //                       borderRadius: BorderRadius.circular(12),
            //                     ),
            //                     alignment: Alignment.center,
            //                     child: TextFormField(
            //                       onChanged: (value) {
            //                         if (value.length == 1) {
            //                           FocusScope.of(context).nextFocus();
            //                         }
            //                       },
            //                       keyboardType: TextInputType.number,
            //                       textAlign: TextAlign.center,
            //                       style: Theme.of(context).textTheme.headlineMedium,
            //                       inputFormatters: [
            //                         LengthLimitingTextInputFormatter(1),
            //                         FilteringTextInputFormatter.digitsOnly,
            //                       ],
            //                       decoration: const InputDecoration(
            //                         border: InputBorder.none,
            //                         counterText: "",
            //                         hintText: "*",
            //                         hintStyle: TextStyle(color: AppColor.primaryColor),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //
            //                 SizedBox(
            //                   height: 68,
            //                   width: 64,
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                       color: Colors.grey.shade200,
            //                       borderRadius: BorderRadius.circular(12),
            //                     ),
            //                     alignment: Alignment.center,
            //                     child: TextFormField(
            //                       onChanged: (value) {
            //                         if (value.length == 1) {
            //                           FocusScope.of(context).nextFocus();
            //                         }
            //                       },
            //                       keyboardType: TextInputType.number,
            //                       textAlign: TextAlign.center,
            //                       style: Theme.of(context).textTheme.headlineMedium,
            //                       inputFormatters: [
            //                         LengthLimitingTextInputFormatter(1),
            //                         FilteringTextInputFormatter.digitsOnly,
            //                       ],
            //                       decoration: const InputDecoration(
            //                         border: InputBorder.none,
            //                         counterText: "",
            //                         hintText: "*",
            //                         hintStyle: TextStyle(color: AppColor.primaryColor),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //
            //                 SizedBox(
            //                   height: 68,
            //                   width: 64,
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                       color: Colors.grey.shade200,
            //                       borderRadius: BorderRadius.circular(12),
            //                     ),
            //                     alignment: Alignment.center,
            //                     child: TextFormField(
            //                       onChanged: (value) {
            //                         if (value.length == 1) {
            //                           FocusScope.of(context).nextFocus();
            //                         }
            //                       },
            //                       keyboardType: TextInputType.number,
            //                       textAlign: TextAlign.center,
            //                       style: Theme.of(context).textTheme.headlineMedium,
            //                       inputFormatters: [
            //                         LengthLimitingTextInputFormatter(1),
            //                         FilteringTextInputFormatter.digitsOnly,
            //                       ],
            //                       decoration: const InputDecoration(
            //                         border: InputBorder.none,
            //                         counterText: "",
            //                         hintText: "*",
            //                         hintStyle: TextStyle(color: AppColor.primaryColor),
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            const SizedBox(height: 100),

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
                  print(controller.text.trim());

                  showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialogBody();
                    },
                  );
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(
                    color: AppColor.backgrondColor,
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 11,),
                children: [
                  const TextSpan(text: 'Didn\'t receive the code?'),
                  TextSpan(
                    text: 'Rsend($_seconds s)',
                    style: const TextStyle(color: AppColor.primaryColor),
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
