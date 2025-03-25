import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final double width;
  final Color colorBorder;
  final Color colorButton;
  final Widget content;

  CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.width = 500,
    required this.colorBorder,
    required this.colorButton,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        child: SizedBox(
          width: width,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                backgroundColor: colorButton,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: colorBorder,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                )),
            child: content,
          ),
        ),
      ),
    );
  }
}
