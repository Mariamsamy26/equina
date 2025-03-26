import 'package:equina/core/color_mang.dart';
import 'package:equina/core/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String clubName;
  final String description;
  final String type;
  final String duration;
  final int numberOfClasses;
  final String price;
  final String imagePath;
  final String discountText;

  const CustomCard({
    Key? key,
    required this.title,
    required this.clubName,
    required this.description,
    required this.type,
    required this.duration,
    required this.numberOfClasses,
    required this.price,
    required this.imagePath,
    required this.discountText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Radius topRight = Radius.circular(10.r);
    Radius topLeft = Radius.circular(80.r);
    Radius bottomRight = Radius.circular(80.r);
    Radius bottomLeft = Radius.circular(10.r);
    Color white = ColorManager.white;
    TextStyle regular = TextManager.regular().copyWith(
      color: ColorManager.white,
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
      height: 300.h,
      decoration: BoxDecoration(
        color: ColorManager.blue,
        borderRadius: BorderRadius.only(
          topRight: topRight,
          topLeft: topLeft,
          bottomRight: bottomRight,
          bottomLeft: bottomLeft,
        ),
        boxShadow: [BoxShadow(color: ColorManager.black, blurRadius: 5)],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h, left: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextManager.bold().copyWith(color: white),
                      ),
                      SizedBox(height: 5.h),
                      Container(
                        width: 155.w,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            clubName,
                            style: TextManager.medium().copyWith(
                              color: ColorManager.blue,
                            ),
                          ),
                        ),
                      ),
                      //data api
                      SizedBox(height: 5.h),
                      Text("Description: $description", style: regular),
                      Text("Type: $type", style: regular),
                      Text("Class Duration: $duration", style: regular),
                      Text(
                        "Number Of Classes: $numberOfClasses",
                        style: regular,
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                Spacer(),
                //price
                Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    color: ColorManager.purple,
                    borderRadius: BorderRadius.only(
                      topRight: topRight,
                      bottomLeft: bottomLeft,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text("Starting from", style: regular),
                      Text(
                        "$price AED",
                        style: TextManager.regular().copyWith(
                          color: ColorManager.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //img part
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                //img
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: topRight,
                    bottomRight: bottomRight,
                  ),
                  child: Image.asset(
                    imagePath,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),

                //discount price
                Positioned(
                  bottom: 20.h,
                  right: 30.w,
                  child: Container(
                    padding: EdgeInsets.all(5.w),
                    decoration: BoxDecoration(
                      color: ColorManager.purple.withAlpha(230),
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: white, width: 1.5.w),
                    ),
                    child: Text(
                      discountText,
                      style: TextManager.regular().copyWith(
                        color: ColorManager.white,
                        fontSize: 10.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
