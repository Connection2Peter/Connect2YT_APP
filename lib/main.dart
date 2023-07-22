import 'package:flutter/material.dart';

void main() {
  runApp(const Connect2YT());
}

class ButtonItem {
  bool onSelect;
  String title;

  ButtonItem(this.onSelect, this.title);
}

class Connect2YT extends StatelessWidget {
  const Connect2YT({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect2YT',
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
  String ytRegex = r'^((?:https:)?\/\/)?((:www)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$';
  TextEditingController urlInput = TextEditingController(text: "");
  List<ButtonItem> typeSelector = [
    ButtonItem(true, "Sound + Video (Default)"),
    ButtonItem(false, "Sound Only"),
    ButtonItem(false, "Video Only"),
  ];

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
              Text("Youtube downloader", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 40),
              Text("Step 1 : Input a YouTube share link", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              TextField(
                autofocus: true,
                controller: urlInput,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Paste URL here',
                ),
              ),
              const SizedBox(height: 20),
              Text("Step 2 : Output component", style: TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              Column(
                children: typeSelector.map((val) {
                  return InkWell(
                    onTap: () {
                      typeSelector.forEach((element) => element.onSelect = false);
                      setState(() {
                        val.onSelect = !val.onSelect;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      width: 240,
                      child: Row(
                        children: [
                          val.onSelect ? Icon(Icons.check_box_outlined) : Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 15,
                          ),
                          Text(val.title, style: TextStyle(fontSize: 17)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              /*const SizedBox(height: 20),
              Text("Step 3 : (Optional) Choose subtitle", style: TextStyle(fontSize: 20)),*/
              const SizedBox(height: 40),
              InkWell(
                onTap: () {
                  if (RegExp(ytRegex).hasMatch(urlInput.text)) {
                    print(urlInput.text);
                    for (var i in typeSelector) {
                      if (i.onSelect) {
                        print(i.title);
                      }
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Invalid URL"),
                          content: Text("Please retype URL\nexample:\nhttps://youtu.be/ALZHF5UqnU4"),
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
