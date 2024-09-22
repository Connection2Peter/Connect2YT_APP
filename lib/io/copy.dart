import '../config.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

Future<void> copyFolder() async {
  Directory dirTemp = await getApplicationCacheDirectory();

  //print('Target Directory: ${dirTemp.path}');

  binFolder = dirTemp.path;

  //print('binFolder: $binFolder');

  for (String program in programWindows) {
    String from = '$binWindows/$program';
    String to = '$binFolder/$program';

    await movePrograms(from, to);
  }
}

Future<void> movePrograms(String from, String to, {bool doChmod = false}) async {
  try {
    final bytes = await rootBundle.load(from);

    final file = File(to);
    await file.create(recursive: true);
    await file.writeAsBytes(
      bytes.buffer.asUint8List(
        bytes.offsetInBytes,
        bytes.lengthInBytes,
      ),
    );

    if (doChmod) {
      await Process.run('chmod', ['+x', to]);
    }
    //print('File copied: $from -> $to');
  } catch (e) {
    //print('Error in movePrograms: $e');
  }
}
