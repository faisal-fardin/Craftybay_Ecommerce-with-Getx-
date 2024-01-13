
import 'package:flutter/material.dart';

class SelectedColor extends StatefulWidget {
  const SelectedColor({super.key});

  @override
  State<SelectedColor> createState() => _SelectedColorState();
}

class _SelectedColorState extends State<SelectedColor> {

  List<Color> colors = [
    Colors.pink,
    Colors.deepOrange,
    Colors.indigo,
    Colors.yellow,
    Colors.blue,
    Colors.black,
  ];

  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  _selectedColor = index;
                  if (mounted) {
                    setState(() {});
                  }
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: colors[index],
                  child: _selectedColor == index
                      ? const Icon(
                    Icons.done,
                    color: Colors.white,
                  )
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
