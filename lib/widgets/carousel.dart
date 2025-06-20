import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/att.png',
    'assets/images/cicek.png',
    'assets/images/orumcek.png',
  ];

  ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imagePaths.map((path) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              child: Image.asset(
                path,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 400,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 16 / 9,
        autoPlayInterval: const Duration(seconds: 2),
      ),
    );
  }
}
