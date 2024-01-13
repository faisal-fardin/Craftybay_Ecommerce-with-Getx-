import 'package:flutter/material.dart';
import '../../../style_file.dart';
import '../utility/color_palette.dart';


class DetailsCartPage extends StatelessWidget {
  const DetailsCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.3),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
      ),
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
              const SizedBox(height: 5,),
              Text('\$1000' ,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor),),
            ],
          ),
          SizedBox(
            width: 130,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: ElevatedButton(
                style: buttonStyle(),
                onPressed: () {
                },
                child: const Center(
                  child: Text(
                    'Add to Cart',
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
    );
  }
}
