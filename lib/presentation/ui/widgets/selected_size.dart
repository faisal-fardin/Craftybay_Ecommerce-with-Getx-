import 'package:flutter/material.dart';
import '../utility/color_palette.dart';

class SelectedSize extends StatefulWidget {
  const SelectedSize({super.key});

  @override
  State<SelectedSize> createState() => _SelectedSizeState();
}

class _SelectedSizeState extends State<SelectedSize> {
  List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
    'XXL',
    '3XL',
  ];

  int _selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 30,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            itemBuilder: (context, index) {
              return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    _selectedSize = index;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(4),
                      color:
                          _selectedSize == index ? AppColor.primaryColor : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      sizes[index],
                      style: TextStyle(
                          color: _selectedSize == index ? Colors.white : null,
                          fontWeight: FontWeight.w700),
                    ),
                  ));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Description',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const Text(
          '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
          sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
          Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
          nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
          Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
           deserunt mollit anim id est laborum.''',
        ),
      ],
    );
  }
}
