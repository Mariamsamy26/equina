import 'package:flutter/material.dart';

import '../color_mang.dart';

class MenuItemModel {
  final String title;
  final dynamic icon;
  final VoidCallback? onTap;
  final Color color;

  MenuItemModel({
    required this.title,
    required this.icon,
    this.onTap,
    this.color=ColorManager.purple,
  });
}
