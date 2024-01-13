import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/color_palette.dart';
import 'add_review_screen.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              title: const Text(
                'Review',
                style: TextStyle(color: Colors.black87, fontSize: 20),
              ),
              leading: const BackButton(
                color: Colors.black54,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Faisal Fardin'),
                      subtitle: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute '),
                    ),
                  ),
                );
              },
            )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.3),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Review (1000)',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  FloatingActionButton(
                    backgroundColor: AppColor.primaryColor,
                    onPressed: () {
                      Get.to(const AddNewReview());
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
