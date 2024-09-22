import 'package:flutter/material.dart';

// # Language
const Map<String, Locale> supportedLocales = {
  "中文": Locale('zh', 'TW'),
  "English": Locale('en', 'US'),
};

// # Program
String binFolder = "";
String binWindows = "assets/bin/Windows_x64";
List<String> programWindows = [
  "ffmpeg.exe",
  "yt-dlp.exe",
  "avcodec-61.dll",
  "avdevice-61.dll",
  "avfilter-10.dll",
  "avformat-61.dll",
  "avutil-59.dll",
  "postproc-58.dll",
  "swresample-5.dll",
  "swscale-8.dll",
];
