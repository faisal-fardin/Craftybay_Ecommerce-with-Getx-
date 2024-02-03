import 'package:craftybay_ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/auth/opt_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../style_file.dart';
import '../../utility/images_assets.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailEditingController = TextEditingController();

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  'Welcome Back',
                  style: headTextStyle(),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Please enter your email address',
                  style: subTitel(),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 22),
                    decoration: appInputStyle('Email Address'),
                    validator: (String? text) {
                      if (text?.isEmpty ?? true) {
                        return "Enter your email address";
                      } else if (text!.isEmail == false) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: GetBuilder<EmailVerificationController>(
                        builder: (controller) {
                      if (controller.emailVerificationInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        style: buttonStyle(),
                        onPressed: () async {
                          if (_fromKey.currentState!.validate()) {
                            verifyEmail(controller);
                          }
                        },
                        child: const Center(
                            child: Text(
                          'Next',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response = await controller.verifyEmail(
      _emailEditingController.text.trim(),
    );
    if (response) {
      Get.to(OtpVerificationScreen(email: _emailEditingController.text.trim(),));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email Verification failed!'),
          ),
        );
      }
    }
  }
}
