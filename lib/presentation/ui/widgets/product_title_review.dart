import 'package:craftybay_ecommerce/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/product_review_screen.dart';
import '../utility/color_palette.dart';
import 'custom_stepper.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
             Expanded(
                child: Text( product.title ?? '00',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5),
                )),
            CustomStepper(
              lowerLimit: 1,
              upperLimit: 10,
              stepValue: 1,
              value: 1,
              onChange: (newValue) {
                print(newValue);
              },
            ),
          ],
        ),
        Row(
          children: [
             Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.amber,
                ),
                Text(
                  '${product.star}',
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.to(const ProductReviewScreen());
              },
              child: Text(
                'Review',
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Card(
              color: AppColor.primaryColor,
              child: const Padding(
                padding: EdgeInsets.all(2.0),
                child: Icon(
                  Icons.favorite_border,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
