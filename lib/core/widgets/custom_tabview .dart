import 'package:equina/core/color_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabView extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> views;

  const CustomTabView({
    Key? key,
    required this.tabs,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            labelColor: ColorManager.black,
            indicatorColor: ColorManager.blue,
            tabs: tabs.map((title) => Tab(text: title)).toList(),
          ),
          SizedBox(
            height: 1000.h,
            child: TabBarView(
              children: views,
            ),
          ),
        ],
      ),
    );
  }
}
