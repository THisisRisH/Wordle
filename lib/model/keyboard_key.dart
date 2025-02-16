import 'dart:ui';

import 'package:flutter/material.dart';

class KeyboardKey {
  String keyChar = " ";
  Color keyColor = const Color.fromARGB(255, 131, 130, 130);
  KeyboardKey(this.keyChar);
  void setColor(Color color) {
    keyColor = color;
  }
}
