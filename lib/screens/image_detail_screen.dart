import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String heroTag;

  ImageDetailScreen({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEDF1F7),
        title: Text(title, style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: heroTag, // Hero 태그를 사용하여 애니메이션 연결
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain, // 이미지를 적절히 맞춤
                  height: 300, // 이미지 높이
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}