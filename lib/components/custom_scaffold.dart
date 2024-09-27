import 'package:flutter/material.dart';

import '../screens/commission_screen.dart';
import '../screens/home_screen.dart';
import '../screens/inquiry_screen.dart';
import '../screens/introduction_screen.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  CustomScaffold({required this.body});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFEDF1F7), // 앱바의 배경색을 #EDF1F7로 설정
        title: Text('Suzy\'s Portfolio', style: TextStyle(color: Colors.black)), // 텍스트 색상 변경
        actions: screenWidth >= 600 ? _buildDesktopMenu(context) : null,
        iconTheme: IconThemeData(color: Colors.black), // 아이콘 색상 변경
        elevation: 0, // 앱바의 그림자 제거
      ),
      drawer: screenWidth < 600 ? _buildDrawer(context) : null,
      body: body,
    );
  }

  // 페이지 이동 시 FadeTransition 애니메이션을 적용하는 함수
  void _navigateWithFade(BuildContext context, String routeName) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return _getPage(routeName);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  // 네비게이션 바 메뉴 (데스크탑)
  List<Widget> _buildDesktopMenu(BuildContext context) {
    return [
      TextButton(
        onPressed: () {
          _navigateWithFade(context, '/');
        },
        child: Text('Home'),
      ),
      TextButton(
        onPressed: () {
          _navigateWithFade(context, '/commission');
        },
        child: Text('Commission'),
      ),
      TextButton(
        onPressed: () {
          _navigateWithFade(context, '/introduction');
        },
        child: Text('Introduction'),
      ),
      TextButton(
        onPressed: () {
          _navigateWithFade(context, '/inquiry');
        },
        child: Text('Inquiry'),
      ),
    ];
  }

  // Drawer (모바일)
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
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
              _navigateWithFade(context, '/');
            },
          ),
          ListTile(
            title: Text('Commission'),
            onTap: () {
              _navigateWithFade(context, '/commission');
            },
          ),
          ListTile(
            title: Text('Introduction'),
            onTap: () {
              _navigateWithFade(context, '/introduction');
            },
          ),
          ListTile(
            title: Text('Inquiry'),
            onTap: () {
              _navigateWithFade(context, '/inquiry');
            },
          ),
        ],
      ),
    );
  }

  // 페이지 라우트에 따라 올바른 페이지 반환
  Widget _getPage(String routeName) {
    switch (routeName) {
      case '/commission':
        return CommissionScreen();
      case '/introduction':
        return IntroductionScreen();
      case '/inquiry':
        return InquiryScreen();
      default:
        return HomeScreen();
    }
  }
}