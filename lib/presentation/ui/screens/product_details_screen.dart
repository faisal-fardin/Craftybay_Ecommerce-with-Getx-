import 'package:flutter/material.dart';
import '../widgets/details_addTocat_page.dart';
import '../widgets/home/product_screen_slider.dart';
import '../widgets/product_title_review.dart';
import '../widgets/selected_color.dart';
import '../widgets/selected_size.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductScreenSlider(),
                AppBar(
                  title: const Text(
                    'Product Details',
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                  leading: const BackButton(
                    color: Colors.black54,
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ],
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductReview(),
                      SelectedColor(),
                      SizedBox(
                        height: 12,
                      ),
                      SelectedSize(),
                    ],
                  ),
                ),
              ),
            ),
            const DetailsCartPage(),
          ],
        ),
      ),
    );
  }
}
