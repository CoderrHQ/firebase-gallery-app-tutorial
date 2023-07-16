import 'dart:io';

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
