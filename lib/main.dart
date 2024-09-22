import 'config.dart';
import 'downloader.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales.values.toList(),
      path: 'assets/translations',
      startLocale: supportedLocales.values.first,
      child: const VideoDownloader(),
    ),
  );
}

class VideoDownloader extends StatelessWidget {
  const VideoDownloader({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Downloader',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const YouTubeDownloader(),
      builder: EasyLoading.init(),
    );
  }
}
