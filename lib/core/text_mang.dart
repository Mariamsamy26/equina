import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextManager {
  static TextStyle regular() {
    return TextStyle(
      fontFamily: 'FuturaPT',
      fontWeight: FontWeight.normal,
      fontSize: 16.sp,
    );
  }

  static TextStyle medium() {
    return TextStyle(
      fontFamily: 'FuturaPT',
      fontWeight: FontWeight.w500,
      fontSize:20.sp,
    );
  }

  static TextStyle bold() {
    return TextStyle(
      fontFamily: 'FuturaPT',
      fontWeight: FontWeight.bold,
      fontSize: 22.sp,
    );
  }
}
