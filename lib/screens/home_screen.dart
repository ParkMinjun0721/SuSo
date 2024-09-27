import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../components/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/suzy1.jpeg',
    // 'assets/images/suzy2.jpeg',
    'assets/images/suzy3.jpeg',
    'assets/images/suzy4.jpeg',
    'assets/images/suzy5.jpeg',
    'assets/images/suzy6.jpeg',
    'assets/images/suzy7.jpeg',
    'assets/images/suzy8.jpeg',
    'assets/images/suzy9.jpeg',
    'assets/images/suzy10.jpeg',
    'assets/images/suzy11.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // 웹 버전 레이아웃
              return _buildWebCarousel();
            } else {
              // 모바일 버전 레이아웃
              return _buildMobileCarousel();
            }
          },
        ),
      ),
    );
  }

  // 웹 버전 Carousel
  Widget _buildWebCarousel() {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          enlargeCenterPage: true,
          aspectRatio: 16 / 9, // 웹 화면에서는 16:9 비율 사용
          viewportFraction: 0.8,
        ),
        items: imageList.map((imagePath) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset(
                imagePath,
                fit: BoxFit.contain,
              );
            },
          );
        }).toList(),
      ),
    );
  }

  // 모바일 버전 Carousel
  Widget _buildMobileCarousel() {
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          enlargeCenterPage: true,
          aspectRatio: 4 / 3, // 모바일에서는 더 작은 비율 사용
          viewportFraction: 0.9,
        ),
        items: imageList.map((imagePath) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset(
                imagePath,
                fit: BoxFit.contain,
              );
            },
          );
        }).toList(),
      ),
    );
  }
}