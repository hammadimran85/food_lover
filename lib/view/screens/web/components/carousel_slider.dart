import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController buttonCarouselController = CarouselController();
    List<Image> carouselImages = [
      Image.asset('images/preview.jpg'),
      Image.asset('images/preview2.png'),
      Image.asset('images/preview.jpg'),
    ];
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CarouselSlider(
          items: carouselImages,
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            height: screenHeight * 0.6,
            viewportFraction: 0.8,
            initialPage: 1,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          ),
        ),
        // Positioned(
        //     top: 55,
        //     left: screenWidth * 0.001,
        //     child: Transform(
        //       alignment: Alignment.center,
        //       transform: Matrix4.rotationY(pi),
        //       child: IconButton(
        //         onPressed: () => buttonCarouselController.previousPage(
        //             duration: const Duration(milliseconds: 300),
        //             curve: Curves.linear),
        //         icon: SvgPicture.asset(
        //           'assets/icons/right_arrow.svg',
        //           width: 40,
        //           color: Theme.of(context).primaryColor.withOpacity(0.3),
        //         ),
        //       ),
        //     )),
        // Positioned(
        //   top: 55,
        //   left: screenWidth * 0.78,
        //   child: IconButton(
        //     onPressed: () => buttonCarouselController.nextPage(
        //         duration: const Duration(milliseconds: 300),
        //         curve: Curves.linear),
        //     icon: SvgPicture.asset(
        //       'assets/icons/right_arrow.svg',
        //       width: 40,
        //       color: Theme.of(context).primaryColor.withOpacity(0.3),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
