import 'package:flutter/material.dart';
import '../utility/color_palette.dart';
import 'custom_stepper.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
                child: Text(
                  'Adidas Shop HK2345 - Black Edition',
                  style: TextStyle(
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
            const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.amber,
                ),
                Text(
                  '4.5',
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey),
                ),
              ],
            ),
            TextButton(
              onPressed: () {

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
