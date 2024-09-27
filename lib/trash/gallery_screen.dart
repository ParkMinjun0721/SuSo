import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'imagedetail_screen.dart';

class GalleryScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        leading: GestureDetector(
          child: Icon(Icons.camera_alt),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/upload');
          },
        ),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('images').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          final images = snapshot.data!.docs;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: images.length,
            itemBuilder: (context, index) {
              final image = images[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageDetailScreen(image: image),
                    ),
                  );
                },
                child: Hero(
                  tag: image.id,  // 이미지의 ID를 태그로 사용
                  child: Image.network(image['url']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
