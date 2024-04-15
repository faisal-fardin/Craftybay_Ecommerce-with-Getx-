import 'package:flutter/material.dart';
import '../utility/color_palette.dart';
import 'custom_stepper.dart';


class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://th.bing.com/th/id/R.12726edfbf4639a4bf42ef5013bb962a?rik=V4iheIz6ysmOuA&riu=http%3a%2f%2fclipart-library.com%2fimages_k%2fshoes-transparent%2fshoes-transparent-1.png&ehk=6zf3EmkoV4xG6fFKuGVLmeULfc%2bOPN7e%2fFqDoRIQxuo%3d&risl=&pid=ImgRaw&r=0'),
                )),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bata New shoe ASDSAFdasfgg',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 18),
                                children: [
                                  TextSpan(text: 'Color : Black '),
                                  TextSpan(text: 'Size : XL'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_forever))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$100',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    FittedBox(
                      child: CustomStepper(
                        lowerLimit: 1,
                        upperLimit: 10,
                        stepValue: 1,
                        value: 1,
                        onChange: (int value) {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
