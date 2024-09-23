import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About the Artist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '소개 텍스트를 여기에 작성하세요.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}