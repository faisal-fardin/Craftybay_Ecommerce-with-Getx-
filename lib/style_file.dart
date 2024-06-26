
import 'package:craftybay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

TextStyle headTextStyle() {
  return const TextStyle(

    fontSize: 35,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );
}

TextStyle subTitel() {
  return  TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.grey.shade600,
  );
}

InputDecoration appInputStyle(label) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      enabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      disabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      border:   OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),
      labelText:label ,
  );
}

ButtonStyle buttonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: const EdgeInsets.symmetric(vertical: 10),
    shadowColor: const Color(0x00000004),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    elevation: 4,
  );
}

PinTheme AppOTPStyle() {
  return PinTheme(
    inactiveColor: AppColors.primaryColor,
    inactiveFillColor: Colors.white,
    selectedColor: AppColors.primaryColor,
    activeColor: AppColors.primaryColor,
    selectedFillColor: AppColors.primaryColor,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 50,
    activeFillColor: Colors.white,
  );
}
