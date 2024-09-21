import 'package:flutter/material.dart';

ButtonStyle buttonStyle() {
  return ButtonStyle(
    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        side: BorderSide(color: Colors.purple),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}
