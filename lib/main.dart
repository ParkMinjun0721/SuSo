import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzysoheee/screens/commission_screen.dart';
import 'package:suzysoheee/screens/desktop_layout.dart';
import 'package:suzysoheee/screens/home_screen.dart';
import 'package:suzysoheee/screens/inquiry_screen.dart';
import 'package:suzysoheee/screens/introduction_screen.dart';
import 'package:suzysoheee/screens/mobile_layout.dart';
import 'app_state.dart';
import 'screens/login_screen.dart';
import 'screens/upload_screen.dart';
import 'screens/gallery_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDAD3pF9RL4ozAE1sTda6JUuS_MJtuKi-E",
      authDomain: "suzysoheee.firebaseapp.com",
      projectId: "suzysoheee",
      storageBucket: "suzysoheee.appspot.com",
      messagingSenderId: "1073979251672",
      appId: "1:1073979251672:web:2024d5512b301fbec670ad",
      measurementId: "G-2N01K13P0K",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LikeProvider()),
      ],
      child: MaterialApp(
        title: 'Artist Portfolio',
        theme: ThemeData(
          primaryColor: Color(0xFFEDF1F7),
          scaffoldBackgroundColor: Color(0xFFEDF1F7),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ResponsiveLayout(),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // 모바일 레이아웃
          return MobileLayout();
        } else {
          // 데스크톱 레이아웃
          return DesktopLayout();
        }
      },
    );
  }
}

