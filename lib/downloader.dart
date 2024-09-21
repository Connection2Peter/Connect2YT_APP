import 'config.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class YouTubeDownloader extends StatefulWidget {
  const YouTubeDownloader({super.key});

  @override
  State<YouTubeDownloader> createState() => _YouTubeDownloaderState();
}

class _YouTubeDownloaderState extends State<YouTubeDownloader> {
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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: currentWidth > 1200 ? currentWidth * 0.25 : currentWidth * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                controller: urlInput,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "input_hint".tr(),
                ),
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {},
              tooltip: "download".tr(),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: BorderSide(color: Colors.purple),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              icon: Icon(Icons.download),
            ),
          ],
        ),
      ),
    );
  }
}
