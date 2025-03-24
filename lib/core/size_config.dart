
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeConfig {
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  init(BuildContext context){
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    defaultSize = orientation == Orientation.landscape 
        ? screenHeight! * 0.024
        : screenWidth! * 0.024;
  }
  static EdgeInsetsGeometry bace =EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w);
  static EdgeInsetsGeometry titil =EdgeInsets.fromLTRB(15.w, 1.h, 15.w, 10.h);
  static double dividerheight =15.h;
  static double bettwenH =10.h;
  static double bettwenW =5.w;

}