import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseServices {
  late Reference firebase_storage;
  Future<String> uploadedFile(String destination, String path) async {
    firebase_storage = FirebaseStorage.instance.ref(destination);
    var result = await firebase_storage.putFile(
        new File(path),
        SettableMetadata(
          cacheControl: "public,max-age=300",
          contentType: "image/jpeg",
        ));
    return result.ref.getDownloadURL();
  }

  Future<String> uploadedFileAsByte(String destination, Uint8List bytes) async {
    firebase_storage = FirebaseStorage.instance.ref(destination);
    var result = await firebase_storage.putData(
        bytes,
        SettableMetadata(
          cacheControl: "public,max-age=300",
          contentType: "image/jpeg",
        ));
    return result.ref.getDownloadURL();
  }

  Future<void> setFileStorageMetadata(String path) async {
    final ref = firebase_storage.child(path);
    final newMetadata = SettableMetadata(
      cacheControl: "public,max-age=300",
      contentType: "image/jpeg",
    );
    await ref.updateMetadata(newMetadata);
  }
}
