import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? _imageUrl;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLogin();
    });
  }

  Future<void> _checkLogin() async {
    User? user = _auth.currentUser;
    if (user == null) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  Future<void> _pickAndUploadImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;

    final pickedFile = result.files.first;
    final fileBytes = pickedFile.bytes;
    final fileName = pickedFile.name;

    try {
      final ref = _storage.ref().child('images/${_auth.currentUser!.uid}/$fileName');
      await ref.putData(fileBytes!);
      final downloadUrl = await ref.getDownloadURL();
      await _firestore.collection('images').add({
        'url': downloadUrl,
        'uploader': _auth.currentUser!.uid,
        'likes': 0,
      });
      setState(() {
        _imageUrl = downloadUrl;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload Successful')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Upload Failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
        leading: GestureDetector(child: Icon(Icons.photo), onTap: (){Navigator.pushNamed(context, '/gallery'); },),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageUrl == null
                ? Text('No image selected.')
                : Image.network(_imageUrl!),
            ElevatedButton(
              onPressed: _pickAndUploadImage,
              child: Text('Pick and Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
