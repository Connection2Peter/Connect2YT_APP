import 'style.dart';
import 'config.dart';
import 'io/picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class YouTubeDownloader extends StatefulWidget {
  const YouTubeDownloader({super.key});

  @override
  State<YouTubeDownloader> createState() => _YouTubeDownloaderState();
}

class _YouTubeDownloaderState extends State<YouTubeDownloader> {
  String saveFolder = "";
  TextEditingController urlInput = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr()),
        actions: supportedLocales.entries
            .map(
              (entry) => Padding(
                padding: EdgeInsets.only(right: 20),
                child: TextButton(
                  onPressed: () {
                    context.setLocale(entry.value);
                  },
                  child: Text(entry.key),
                ),
              ),
            )
            .toList(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: currentWidth > 1200 ? currentWidth * 0.25 : currentWidth * 0.05,
          ),
          child: Column(
            children: [
              step1EnterUrl(),
              const SizedBox(height: 30),
              if (urlInput.text.isNotEmpty) step2SelectSaveFolder(),
              const SizedBox(height: 30),
              if (urlInput.text.isNotEmpty && saveFolder.isNotEmpty) step3RunDownloader()
            ],
          ),
        ),
      ),
    );
  }

  Widget step1EnterUrl() {
    return TextField(
      autofocus: true,
      controller: urlInput,
      onChanged: (value) {
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: "input_hint".tr(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget step2SelectSaveFolder() {
    return TextButton(
      onPressed: () {
        selectFolder().then((value) {
          setState(() {
            saveFolder = value;
          });
        });
      },
      style: buttonStyle(),
      child: Text("select_folder".tr()),
    );
  }

  Widget step3RunDownloader() {
    return TextButton.icon(
      onPressed: () {},
      label: Text("download".tr()),
      style: buttonStyle(),
      icon: Icon(Icons.download),
    );
  }
}
