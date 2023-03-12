import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:loma/backend/util.dart';

class FirebaseServices {
  static Future<String> uploadedFile(String path) async {
    String destination = Util().simple_uuid() +
        "." +
        path.split(".").last; //firebase storage location
    final firebase_storage = FirebaseStorage.instance.ref(destination);
    var result = await firebase_storage.putFile(new File(path));
    return result.ref.getDownloadURL();
  }
}
