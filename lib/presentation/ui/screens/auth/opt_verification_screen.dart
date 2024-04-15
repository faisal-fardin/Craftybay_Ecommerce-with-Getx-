
import 'package:craftybay_ecommerce/presentation/state_holders/otp_verification_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../style_file.dart';
import '../../utility/color_palette.dart';
import '../../utility/images_assets.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});


  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  final TextEditingController _otpController = TextEditingController();
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
                const SizedBox(height: 100,),
                Center(
                    child: SvgPicture.asset(
                      ImageAssets.craftyBayLogoSVG,
                      width: 100,
                      height: 100,
                    ),),
                const SizedBox(height: 20,),
                Text('Enter OTP Code', style: headTextStyle(),),
                const SizedBox(height: 8,),
                Text('A 4 Digit OTP Code has been sent', style: subTitel(),),
                const SizedBox(height: 12,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  PinCodeTextField(
                    controller: _otpController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your OTP Code";
                      }
                      return null;
                    },
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 45,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.primaryColor,
                      inactiveColor: AppColors.primaryColor,
                      selectedColor: Colors.green,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    onCompleted: (v) {},
                    onChanged: (value) {},
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: GetBuilder<OtpVerificationController>(
                    builder: (controller) {
                      if (controller.otpVerificationInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: buttonStyle(),
                          onPressed: () {
                            if (_fromKey.currentState!.validate()) {
                              verifyOtp(controller);
                            }
                          },
                          child: const Center(
                              child: Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),),
                        ),
                      );
                    }
                  ),
                ),
                const SizedBox(height: 20,),
                RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'This Code will expire in ',
                        style: subTitel(),
                      ),
                      TextSpan(
                          text: '120s',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ])),
                const SizedBox(height: 10,),
                InkWell(
                    onTap: (){},
                    child: Text(
                      'Resend Code',
                      style: subTitel(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> verifyOtp(OtpVerificationController controller) async {
    final response = await controller.verifyOtp(widget.email, _otpController.text.trim());
    if (response) {
      Get.offAll(()=> const MainBottomNavScreen());
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Otp Verification failed!'),
          ),
        );
      }
    }
  }
}
