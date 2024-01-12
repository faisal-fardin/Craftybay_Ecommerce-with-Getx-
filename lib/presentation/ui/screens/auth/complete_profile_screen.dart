
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../style_file.dart';
import '../../utility/images_assets.dart';

class ComplateProfileScreen extends StatefulWidget {
  const ComplateProfileScreen({super.key});

  @override
  State<ComplateProfileScreen> createState() => _ComplateProfileScreenState();
}

class _ComplateProfileScreenState extends State<ComplateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Center(
                  child: SvgPicture.asset(
                    ImageAssets.craftyBayLogoSVG,
                    width: 100,
                    height: 100,
                  ),),
                Text('Complate Profile', style: headTextStyle(),),
                const SizedBox(height: 8,),
                Text('Get stared with us by share your details ', style: subTitel(),),
                const SizedBox(height: 15,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  style: const TextStyle(fontSize: 22),
                  decoration: appInputStyle('First Name'),
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  keyboardType: TextInputType.name,
                  style: const TextStyle(fontSize: 22),
                  decoration: appInputStyle('Last Name'),
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 22),
                  decoration: appInputStyle('Mobile'),
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 22),
                  decoration: appInputStyle('City'),
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    hintText: 'Shipping Address',
                    contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    border:  OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),

                ),
                const SizedBox(height: 12,),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: buttonStyle(),
                      onPressed: () {
                      },
                      child: const Text(
                        'Complete',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
