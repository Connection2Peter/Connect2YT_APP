import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';

Stream<String> executeCommand(String command) async* {
  final process = await Process.start('/bin/sh', ['-c', command]);
  await for (var line in process.stdout.transform(utf8.decoder).transform(const LineSplitter())) {
    yield line;
  }
}

class CommandOutputWidget extends StatelessWidget {
  final String command;

  const CommandOutputWidget({Key? key, required this.command}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: executeCommand(command),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Awaiting result...');
          default:
            if (snapshot.hasData) {
              return Text(snapshot.data!);
            } else {
              return const Text('No data');
            }
        }
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Command Output')),
      body: CommandOutputWidget(command: 'ls -l'),
    );
  }
}
