import 'package:craftybay_ecommerce/data/models/categoryData.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.categoryData,
  });

 final CategoryData categoryData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        children: [
          Container(
            height: 65,
            width: 65,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(categoryData.categoryImg ?? '',height: 50,),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            categoryData.categoryName ?? '',
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