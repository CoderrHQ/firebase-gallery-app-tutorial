import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  File? image;
  try {
    ImagePicker picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      image = File(file.path);
    }
    return image;
  } catch (e) {
    print(e);
    return null;
  }
}

Future<String?> saveImageToFirebase(File image) async {
  try {
    FirebaseStorage storage = FirebaseStorage.instance;
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference = storage.ref().child('images/$imageName');

    // Upload teh file
    await storageReference.putFile(image);

    // Get the download url for the image
    String downloadUrl = await storageReference.getDownloadURL();

    // Now let's the link of the image to firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore.collection('images').add({
      'id': DateTime.now().toIso8601String(),
      'url': downloadUrl,
    });

    return downloadUrl;
  } catch (e) {
    print(e);
    return null;
  }
}
