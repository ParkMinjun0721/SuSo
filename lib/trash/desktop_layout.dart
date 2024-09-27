// desktop_layout.dart
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/commission_screen.dart';
import '../screens/introduction_screen.dart';
import '../screens/inquiry_screen.dart';

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artist Portfolio'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Text('Home'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CommissionScreen()));
            },
            child: Text('Commission'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => IntroductionScreen()));
            },
            child: Text('Introduction'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => InquiryScreen()));
            },
            child: Text('Inquiry'),
          ),
        ],
      ),
      body: HomeScreen(), // 기본적으로 Home 화면 표시
    );
  }
}