import 'package:file_picker/file_picker.dart';

Future<String> selectFolder() async {
  return await FilePicker.platform.getDirectoryPath() ?? '';
}
