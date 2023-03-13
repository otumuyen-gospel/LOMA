import 'package:file_picker/file_picker.dart';
import 'package:loma/backend/firebase_backend.dart';
import 'package:loma/backend/util.dart';

class SystemFilePicker {
  filePicker() async {
    var result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result == null) {
      return null;
    } else {
      String path = await Util()
          .compressImage(result.files.first.path!); //compress selected file
      return FirebaseServices.uploadedFile(path);
    }
  }
}
