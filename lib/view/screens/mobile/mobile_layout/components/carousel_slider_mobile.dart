import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'dart:math';

class CarouselSliderMobile extends StatelessWidget {
  const CarouselSliderMobile({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    // final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    List<Image> carouselImages = [
      Image.asset(
        'assets/images/preview.jpg',
      ),
      Image.asset('assets/images/preview2.png'),
      Image.asset('assets/images/preview.jpg'),
    ];
    return Stack(
      children: [
        CarouselSlider(
          items: carouselImages,
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            height: screenWidth * 0.4,
            viewportFraction: 0.75,
            initialPage: 1,
            enableInfiniteScroll: true,
            reverse: true,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
