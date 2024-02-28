import 'package:craftybay_ecommerce/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/category_card.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        return Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Category',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().backToHome();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(
                  const Duration(milliseconds: 400));
              Get.find<CategoryController>().getCategory();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: GetBuilder<CategoryController>(builder: (categoryController) {
              if(categoryController.getCategoryModelInProgress){
                return const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return GridView.builder(
                padding: const EdgeInsets.only(top: 10),
                itemCount: categoryController.categoryModel.data?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: CategoryCard(
                      categoryData: categoryController.categoryModel.data![index],
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
