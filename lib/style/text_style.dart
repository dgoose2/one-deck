import 'package:flutter/material.dart';

FontWeight regular = FontWeight.w400;

class TextStyles {
  TextStyle font1(Color? color) {
    return TextStyle(
      fontFamily: "Voice9h",
      fontWeight: regular,
      fontSize: 50,
      color: color,
    );
  }
  TextStyle font2(Color? color) {
    return TextStyle(
      fontFamily: "Voice7h",
      fontWeight: regular,
      fontSize: 50,
      color: color,
    );
  }
  TextStyle font3(Color? color) {
    return TextStyle(
      fontFamily: "Voice7h",
      fontWeight: regular,
      fontSize: 40,
      color: color,
    );
  }
}
