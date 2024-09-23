// mobile_layout.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'commission_screen.dart';
import 'introduction_screen.dart';
import 'inquiry_screen.dart';

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artist Portfolio'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFEDF1F7),
              ),
              child: Text('Navigation'),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              title: Text('Commission'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CommissionScreen()));
              },
            ),
            ListTile(
              title: Text('Introduction'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => IntroductionScreen()));
              },
            ),
            ListTile(
              title: Text('Inquiry'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => InquiryScreen()));
              },
            ),
          ],
        ),
      ),
      body: HomeScreen(), // 기본적으로 Home 화면 표시
    );
  }
}