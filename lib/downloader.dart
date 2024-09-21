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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(50),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("title".tr(), style: TextStyle(fontSize: 30)),
              const SizedBox(height: 40),
              Container(
                constraints: BoxConstraints(maxWidth: 700),
                child: TextField(
                  autofocus: true,
                  controller: urlInput,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "input_hint".tr(),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 300,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Download now !", style: TextStyle(fontSize: 20)),
                      SizedBox(width: 15),
                      Icon(Icons.download, size: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
