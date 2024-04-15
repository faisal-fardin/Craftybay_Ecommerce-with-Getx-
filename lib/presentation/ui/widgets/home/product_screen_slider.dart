import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utility/color_palette.dart';

class ProductScreenSlider extends StatefulWidget {
  final List<String> imagesList;

  const ProductScreenSlider({super.key, required this.imagesList});

  @override
  State<ProductScreenSlider> createState() => _ProductScreenSliderState();
}

class _ProductScreenSliderState extends State<ProductScreenSlider> {
  final ValueNotifier<int> _selected = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 300.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (int page, _) {
              _selected.value = page;
            },
          ),
          items: widget.imagesList.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                    ),
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _selected,
            builder: (context, value, _) {
              List<Widget> list = [];
              for (int i = 0; i < widget.imagesList.length; i++) {
                list.add(Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: value == i ? AppColors.primaryColor : Colors.white,
                  ),
                ));
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              );
            },
          ),
        ),
      ],
    );
  }
}
