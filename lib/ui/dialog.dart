import '../style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

showResult(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: buttonStyle(),
            child: Text("ok".tr()),
          ),
        ],
      );
    },
  );
}
