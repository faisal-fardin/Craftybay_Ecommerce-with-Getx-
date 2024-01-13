import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style_file.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../utility/color_palette.dart';
import '../widgets/cart_product_card.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Carts',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const CartProductCard();
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$1000',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryColor),
                    ),
                  ],
                ),
                SizedBox(
                  width: 130,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: ElevatedButton(
                      style: buttonStyle(),
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
