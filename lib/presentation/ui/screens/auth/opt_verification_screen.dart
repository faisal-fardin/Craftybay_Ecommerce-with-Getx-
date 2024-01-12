
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../style_file.dart';
import '../../utility/color_palette.dart';
import '../../utility/images_assets.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                child: PinCodeTextField(
                  keyboardType: TextInputType.number,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  appContext: context,
                  length: 4,
                  pinTheme: AppOTPStyle(),
                  enableActiveFill: true,
                  animationDuration: const Duration(milliseconds: 300),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: buttonStyle(),
                    onPressed: () {

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
                            color: AppColor.primaryColor,
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
    );
  }
}
