import 'downloader.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(const VideoDownloader());
}

class VideoDownloader extends StatelessWidget {
  const VideoDownloader({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Downloader',
      debugShowCheckedModeBanner: false,
      home: const YouTubeDownloader(),
    );
  }
}
