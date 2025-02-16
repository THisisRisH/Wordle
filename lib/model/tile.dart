import 'package:flutter/material.dart';

class Tile {
  late int index;
  Color color = Colors.grey;
  String text = " ";
  Tile(int index) {
    this.index = index;
  }
  void setColor(Color color) {
    this.color = color;
  }

  void setText(String text) {
    this.text = text;
  }
}
