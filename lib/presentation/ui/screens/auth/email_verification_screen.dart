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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            )),
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
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontSize: 22),
                decoration: appInputStyle('Email Address'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    Get.to(const OtpVerificationScreen());
                  },
                  child: const Center(
                      child: Text(
                    'Next',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
