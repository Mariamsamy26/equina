import 'package:flutter/material.dart';

class TextManager {
  static TextStyle regular() {
    return TextStyle(
      fontFamily: 'FuturaPT',
      fontWeight: FontWeight.normal,
      fontSize: 16,
    );
  }

  static TextStyle medium() {
    return TextStyle(
      fontFamily: 'FuturaPT',
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );
  }

  static TextStyle bold() {
    return TextStyle(
      fontFamily: 'FuturaPT',
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
  }
}
