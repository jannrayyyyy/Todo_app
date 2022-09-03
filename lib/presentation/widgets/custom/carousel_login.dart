import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/utils/carousel_login_items.dart';

import '../components/custom_text.dart';

class CarouselLogin extends StatefulWidget {
  const CarouselLogin({Key? key}) : super(key: key);

  @override
  State<CarouselLogin> createState() => _CarouselLoginState();
}

class _CarouselLoginState extends State<CarouselLogin> {
  int _current = 0;
  List<int> indexList = [0, 1, 2];
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: carouselItems.map((e) {
            return Column(
              children: [
                Column(
                  children: [
                    Image.asset(
                      e.image,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomText(text: e.text),
                    )
                  ],
                ),
              ],
            );
          }).toList(),
          options: CarouselOptions(
              viewportFraction: 1,
              height: 300,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indexList.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                  ),
                );
              }).toList(),
            ))
      ],
    );
  }
}
