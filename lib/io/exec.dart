import '../config.dart';
import 'dart:io';

Future<bool> runYtDlp(String url, String saveTo) async {
  final result = await Process.run(
    "$binFolder\\yt-dlp.exe",
    [
      "-o",
      "$saveTo\\%(title)s.%(ext)s",
      url,
    ],
  );

  return result.stdout.contains("ERROR");
}
