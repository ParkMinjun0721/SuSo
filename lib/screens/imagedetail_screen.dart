import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:suzysoheee/app_state.dart';

String encodeFirebaseUrl(String url) {
  return Uri.encodeFull(url).replaceAll('%2F', '/');
}

class ImageDetailScreen extends StatefulWidget {
  final DocumentSnapshot image;
  static const String adminUid = 'YOUR_ADMIN_UID'; // 관리자 계정 UID

  ImageDetailScreen({required this.image});

  @override
  _ImageDetailScreenState createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  @override
  void initState() {
    super.initState();
    final likeProvider = Provider.of<LikeProvider>(context, listen: false);
    likeProvider.fetchLikes(widget.image.id);
  }

  Future<void> _deleteImage() async {
    try {
      // Firebase Storage에서 이미지 삭제
      final storageRef = FirebaseStorage.instance.refFromURL(widget.image['url']);
      await storageRef.delete();

      // Firestore에서 이미지 데이터 삭제
      await FirebaseFirestore.instance.collection('images').doc(widget.image.id).delete();

      // 삭제 성공 시 이전 화면으로 돌아가기
      Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Delete Failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final String imageId = widget.image.id;
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
        actions: [
          if (currentUser != null && (currentUser.uid == widget.image['uploader'] || currentUser.uid == ImageDetailScreen.adminUid))
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: _deleteImage,
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: imageId,
                child: Image.network(
                  widget.image['url'],
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Text('Failed to load image');
                  },
                ),
              ),
              Consumer<LikeProvider>(
                builder: (context, likeProvider, child) {
                  return Text('Likes: ${likeProvider.likes[imageId] ?? widget.image['likes']}');
                },
              ),
              ElevatedButton(
                onPressed: () => Provider.of<LikeProvider>(context, listen: false).likeImage(imageId),
                child: Text('Like'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
