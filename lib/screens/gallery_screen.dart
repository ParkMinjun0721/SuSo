import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
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
                child: Image.network(image['url']),
              );
            },
          );
        },
      ),
    );
  }
}

class ImageDetailScreen extends StatelessWidget {
  final DocumentSnapshot image;

  ImageDetailScreen({required this.image});

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _likeImage() async {
    await _firestore.runTransaction((transaction) async {
      final freshSnapshot = await transaction.get(image.reference);
      final freshLikes = freshSnapshot['likes'] + 1;
      transaction.update(image.reference, {'likes': freshLikes});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
      ),
      body: Column(
        children: [
          Image.network(image['url']),
          Text('Likes: ${image['likes']}'),
          ElevatedButton(
            onPressed: _likeImage,
            child: Text('Like'),
          ),
        ],
      ),
    );
  }
}
