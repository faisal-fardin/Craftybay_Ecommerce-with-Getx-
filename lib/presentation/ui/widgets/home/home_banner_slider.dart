import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay_ecommerce/data/models/slider_model.dart';
import 'package:flutter/material.dart';

import '../../utility/color_palette.dart';

class HomeBannerSlider extends StatefulWidget {
   final List<SliderData> sliders;
  const HomeBannerSlider({super.key, required this.sliders});

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {
  final ValueNotifier<int> _selectedSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 3),
              onPageChanged: (int page, _) {
                _selectedSlider.value = page;
              }),
          items: widget.sliders.map((sliderData) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration:  BoxDecoration(color: AppColor.primaryColor.withOpacity(0.4)),
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Image.network(sliderData.image ?? ''),
                      Positioned(
                        bottom: 0,
                        child: Text(sliderData.title ?? '' ,style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder(
          valueListenable: _selectedSlider,
          builder: (context, value, _) {
            List<Widget> list = [];
            for (int i = 0; i < widget.sliders.length; i++) {
              list.add(
                Container(
                  width: 15,
                  height: 15,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                      color: value == i ? AppColor.primaryColor : null),
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list,
            );
          },
        ),
      ],
    );
  }
}
