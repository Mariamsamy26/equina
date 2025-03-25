import 'package:equina/core/size_config.dart';
import 'package:equina/core/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_mang.dart';

class UsersTypeButton extends StatelessWidget {
  final void Function()? onPressed;
  final double height;
  final String user;
  final bool select;

  UsersTypeButton({
    super.key,
    required this.onPressed,
    this.height = 100,
    required this.user,
    this.select = false,
  });

  @override
  Widget build(BuildContext context) {
    Color selectColor = select ? ColorManager.blue : ColorManager.lightGrey;
    Color radioColor = select
        ? ColorManager.blue
        : ColorManager.lightGrey.withAlpha(10);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: height,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            border: Border.all(color: selectColor, width: 1.w),
            borderRadius: BorderRadius.circular(8.r),
            color: ColorManager.white,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        selectColor,
                        BlendMode.srcIn,
                      ),
                      child: Image.asset(
                        "assets/images/profile_grey.png",
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(user, style: TextManager.regular()),
                  ],
                ),
              ),

              Positioned(
                top: 4.h,
                right: 4.w,
                child: Container(
                  width: 18.w,
                  height: 18.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: selectColor, width: 2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: radioColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
