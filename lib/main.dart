import 'dart:html' as html;
import 'package:flutter/material.dart';

void main() {
  runApp(const Connect2Video());
}

class Connect2Video extends StatelessWidget {
  const Connect2Video({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect2Video',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const YouTubeDownloader(),
    );
  }
}

class YouTubeDownloader extends StatefulWidget {
  const YouTubeDownloader({super.key});

  @override
  State<YouTubeDownloader> createState() => _YouTubeDownloaderState();
}

class _YouTubeDownloaderState extends State<YouTubeDownloader> {
  bool processing = false;
  String baseURL = "http://mothra.life.nctu.edu.tw:9487";
  RegExp validUrl = RegExp(r"https?://(www\.)?[-a-zA-Z0-9@:%._+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_+.~#?&/=]*)");
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
              Text("Video downloader", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 40),
              Text("Input A share link of video", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(maxWidth: 700),
                child: TextField(
                  autofocus: true,
                  controller: urlInput,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Paste URL here ~',
                  ),
                ),
              ),
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  if (urlInput.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("No content"),
                          content: SelectableText("Please type a URL\nexample:\nhttps://youtu.be/ALZHF5UqnU4"),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    if (validUrl.hasMatch(urlInput.text)) {
                      var fileUri = baseURL + "/video?url=${urlInput.text}";
                      html.AnchorElement anchorElement = html.AnchorElement(href: fileUri);
                      anchorElement.download = fileUri;
                      anchorElement.click();
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Invalid URL"),
                            content: SelectableText("Please type again\nexample:\nhttps://youtu.be/ALZHF5UqnU4"),
                            actions: [
                              TextButton(
                                child: const Text('Clear'),
                                onPressed: () {
                                  setState(() {
                                    urlInput.text = "";
                                  });
                                },
                              ),
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
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
                      processing ? CircularProgressIndicator() : Text("Download now !", style: TextStyle(fontSize: 20)),
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
