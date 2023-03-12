import 'package:file_picker/file_picker.dart';
import 'package:loma/backend/firebase_backend.dart';

class SystemFilePicker {
  filePicker() async {
    var result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);
    if (result == null) {
      return null;
    } else {
      return FirebaseServices.uploadedFile(result.files.first.path!);
    }
  }
}
