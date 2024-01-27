

import 'package:craftybay_ecommerce/presentation/state_holders/email_verification_controller.dart';
import 'package:get/get.dart';
import '../presentation/state_holders/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(EmailVerificationController());
  }

}