
import 'package:craftybay_ecommerce/presentation/state_holders/category_controller.dart';
import 'package:craftybay_ecommerce/presentation/state_holders/home_slider_controller.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/cart_screen.dart';
import 'package:craftybay_ecommerce/presentation/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../utility/color_palette.dart';
import 'category_list_screen.dart';
import 'home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {

  MainBottomNavController mainBottomNavController = Get.put(MainBottomNavController(),);

  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CardScreen(),
    const WishListScreen(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getHomeSlider();
      Get.find<CategoryController>().getCategory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavController>(
          builder: (controller) {
            return _screen[controller.currentSelectedIndex];
          }
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavController>(
          builder: (context) {
            return BottomNavigationBar(
                currentIndex: mainBottomNavController.currentSelectedIndex,
                onTap: mainBottomNavController.changeScreen,
                selectedItemColor: AppColor.primaryColor,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: true,
                elevation: 4,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard), label: 'Categories'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: 'Card'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'WishList'),
                ]);
          }
      ),
    );
  }
}

