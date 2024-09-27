import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suzysoheee/screens/commission_screen.dart';
import 'package:suzysoheee/trash/desktop_layout.dart';
import 'package:suzysoheee/screens/home_screen.dart';
import 'package:suzysoheee/screens/inquiry_screen.dart';
import 'package:suzysoheee/screens/introduction_screen.dart';
import 'package:suzysoheee/trash/mobile_layout.dart';
import 'app_state.dart';
import 'trash/login_screen.dart';
import 'trash/upload_screen.dart';
import 'trash/gallery_screen.dart';

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
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/commission': (context) => CommissionScreen(),
          '/introduction': (context) => IntroductionScreen(),
          '/inquiry': (context) => InquiryScreen(),
        },
      ),
    );
  }
}

