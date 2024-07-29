import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text("현재 테스트중"),
            Text("이메일: test@gmail.com"),
            Text("비밀번호: 1q2w3e4r!@#"),
            Divider(),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  // 로그인 성공 시 업로드 화면으로 이동
                  Navigator.pushReplacementNamed(context, '/gallery');
                } catch (e) {
                  // 오류 처리
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Error: $e'),
                  ));
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
