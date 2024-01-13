import 'package:craftybay_ecommerce/presentation/ui/screens/wish_list_screen.dart';
import 'package:flutter/material.dart';
import '../utility/color_palette.dart';
import 'category_list_screen.dart';
import 'home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screen = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CategoryListScreen(),
    const WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            _selectedIndex = index;
            if (mounted) {
              setState(() {});
            }
          },
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
          ]),
    );
  }
}
