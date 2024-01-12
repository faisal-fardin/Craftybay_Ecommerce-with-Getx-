
import 'package:craftybay_ecommerce/presentation/ui/screens/splash_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(AppColor.primaryColor.value , AppColor().color),
      ),
      home: const SplashScreen(),
    );
  }
}
