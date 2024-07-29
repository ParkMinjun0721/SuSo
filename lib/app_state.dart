import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LikeProvider with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, int> _likes = {};

  Map<String, int> get likes => _likes;

  void fetchLikes(String imageId) {
    _firestore.collection('images').doc(imageId).snapshots().listen((snapshot) {
      _likes[imageId] = snapshot.data()?['likes'] ?? 0;
      notifyListeners();
    });
  }

  void likeImage(String imageId) async {
    await _firestore.runTransaction((transaction) async {
      final freshSnapshot = await transaction.get(_firestore.collection('images').doc(imageId));
      final freshLikes = freshSnapshot['likes'] + 1;
      transaction.update(_firestore.collection('images').doc(imageId), {'likes': freshLikes});
    });
  }
}
