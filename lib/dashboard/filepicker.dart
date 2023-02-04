import 'package:file_picker/file_picker.dart';

class SystemFilePicker{
  filePicker() async {
    var result = await FilePicker.platform.pickFiles(allowMultiple: false, type: FileType.image);
    if(result == null){
      return "";
    }else{
      return result.files.first.path!;
    }
  }
}