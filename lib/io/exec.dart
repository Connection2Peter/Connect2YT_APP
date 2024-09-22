import '../config.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

Future<bool> runYtDlp(String url, String saveTo) async {
  final result = await Process.run(
    path.join(binFolder, 'yt-dlp.exe'),
    [
      "-o",
      "$saveTo\\%(title)s.%(ext)s",
      url,
    ],
  );

  return result.stderr.isEmpty;
}
