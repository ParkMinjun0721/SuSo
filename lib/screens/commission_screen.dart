import 'package:flutter/material.dart';

class CommissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commission'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/sample_image_$index.jpg'), // 이미지
                ),
                Text('Title $index'), // 제목
              ],
            ),
          );
        },
      ),
    );
  }
}