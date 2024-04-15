import 'package:craftybay_ecommerce/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/new_product_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/popular_product_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/special_product_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/product_list_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/color_palette.dart';
import 'package:craftybay_ecommerce/presentation/ui/utility/images_assets.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/circular_icon_button.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/home/home_banner_slider.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/home/section_header.dart';
import 'package:craftybay_ecommerce/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              ImageAssets.craftBayNavLogoSvg,
              height: 30,
            ),
            const Spacer(),
            CircularIconButton(icon: Icons.person, onTap: () {}),
            const SizedBox(
              width: 10,
            ),
            CircularIconButton(icon: Icons.call, onTap: () {}),
            const SizedBox(
              width: 10,
            ),
            CircularIconButton(icon: Icons.notifications, onTap: () {}),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 22,
                      color: AppColors.primaryColor,
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: 'Search',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    )),
              ),
              const SizedBox(height: 16),
              GetBuilder<HomeSliderController>(
                builder: (homeSliderController) {
                  if(homeSliderController.getHomeSliderInProgress){
                    return const SizedBox(
                      height: 180,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return HomeBannerSlider(
                    sliders: homeSliderController.sliderModel.data ?? [],
                  );
                },
              ),
              const SizedBox(height: 16),
              SectionHeader(
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
                title: 'Categories',
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 100,
                child: GetBuilder<CategoryController>(
                  builder: (categoryController) {
                    if(categoryController.getCategoryModelInProgress){
                    return const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                    return ListView.builder(
                      itemCount: categoryController.categoryModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryCard(categoryData: categoryController.categoryModel.data![index],);
                      },
                    );
                  }
                ),
              ),
              const SizedBox(height: 16),
              SectionHeader(
                onTap: () {
                  Get.to(const ProductListScreen());
                },
                title: 'Popular',
              ),
              SizedBox(
                height: 170,
                child: GetBuilder<PopularProductController>(
                  builder: (productController) {
                    if(productController.getPopularProductInProgress){
                      return const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productController.productModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return  ProductCard(
                          product: productController.productModel.data![index],);
                      },
                    );
                  }
                ),
              ),
              const SizedBox(height: 16),
              SectionHeader(
                onTap: () {
                  Get.to(const ProductListScreen());
                },
                title: 'Special',
              ),
              SizedBox(
                height: 170,
                child: GetBuilder<SpecialProductController>(
                    builder: (specialProduct) {
                      if(specialProduct.getSpecialProductInProgress){
                        return const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: specialProduct.productModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return  ProductCard(
                            product: specialProduct.productModel.data![index],);
                        },
                      );
                    }
                ),
              ),
              const SizedBox(height: 16),
              SectionHeader(
                onTap: () {
                  Get.to(const ProductListScreen());
                },
                title: 'New',
              ),
              SizedBox(
                height: 170,
                child: GetBuilder<NewProductController>(
                    builder: (newProductController) {
                      if(newProductController.getNewProductInProgress){
                        return const SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newProductController
                            .productModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          return  ProductCard(
                            product: newProductController.productModel.data![index],);
                        },
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
