import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
          measurementId: "G-2N01K13P0K"
      )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Firebase Web'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
