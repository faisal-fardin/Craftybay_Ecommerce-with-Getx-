
import 'package:craftybay_ecommerce/data/models/product.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/color_palette.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });


  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: (){
        Get.to( const ProductDetailsScreen( ));
      },
      child: Card(
        shadowColor: AppColors.primaryColor.withOpacity(.2),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SizedBox(
          width: 120,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image:  DecorationImage(
                    image: NetworkImage(product.image ?? ''),
                  ),
                ),
              ),
              Padding(
                padding:  const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(
                      product.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price ?? 0}',
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                         Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.amber,
                            ),
                            Text(
                              '${product.star ?? 0}',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blueGrey),
                            ),
                          ],
                        ),
                         Card(
                          color: AppColors.primaryColor,
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}