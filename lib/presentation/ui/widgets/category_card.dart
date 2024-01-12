import 'package:flutter/material.dart';

import '../utility/color_palette.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.shop,
              size: 35,
              color: AppColor.primaryColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Electronics',
            style: TextStyle(
                fontSize: 15,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}