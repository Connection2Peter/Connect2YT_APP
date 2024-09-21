import '../config.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<void> copyFolder() async {
  Directory dirTemp = await getTemporaryDirectory();

  binFolder = '${dirTemp.path}\\$binFolder';

  Directory targetDir = Directory(binFolder);
  if (!targetDir.existsSync()) {
    targetDir.createSync(recursive: true);
  }

  await copyDirectoryRecursively(binWindows, binFolder);
}

Future<void> copyDirectoryRecursively(String from, String to) async {
  final directory = Directory(from);

  if (await directory.exists()) {
    await for (FileSystemEntity entity in directory.list(
      recursive: true,
      followLinks: false,
    )) {
      if (entity is File) {
        String relativePath = entity.path.replaceFirst(from, '');

        await movePrograms(entity.path, '$to\\$relativePath');
      }
    }
  }
}

Future<void> movePrograms(String from, String to, {bool doChmod = false}) async {
  final bytes = await rootBundle.load(from);

  await File(to).writeAsBytes(
    bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes),
  );

  if (doChmod) {
    await Process.run('chmod', ['+x', to]);
  }
}
