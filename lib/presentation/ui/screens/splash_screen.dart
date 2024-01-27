import 'package:craftybay_ecommerce/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/images_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'auth/email_verification_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goTOHomeScreen();
  }

  void goTOHomeScreen() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAll(const EmailVerificationScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
              child: SvgPicture.asset(
            ImageAssets.craftyBayLogoSVG,
            width: 100,
            height: 100,
          )),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox( height: 16,),
          const Text(
            'Version 1.0.0',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
