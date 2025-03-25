import 'package:equina/core/color_mang.dart';
import 'package:equina/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/models/menuItem_model.dart';
import '../auth/auth_screen.dart';
import '../../core/text_mang.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = 'Profile Screen';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MenuItemModel> menuItems = [
      MenuItemModel(title: "Edit Profile", icon: "assets/images/profile_grey.png"),
      MenuItemModel(title: "My Points", icon: "assets/images/points.png"),
      MenuItemModel(title: "My Notifications", icon: Icons.notifications_sharp),
      MenuItemModel(title: "Manage Family", icon: "assets/images/family.png"),
      MenuItemModel(title: "Livery Settings", icon: Icons.settings),
      MenuItemModel(title: "Fill Medical Report", icon: "assets/images/medical_report.png"),
      MenuItemModel(title: "Fill Club Application", icon: "assets/images/clipboard.png"),
      MenuItemModel(title: "Billing Details", icon: "assets/images/bill.png"),
      MenuItemModel(title: "Tutorial Guides", icon: "assets/images/idea.png"),
      MenuItemModel(title: "Information", icon: Icons.info),
      MenuItemModel(title: "Contact Us", icon: Icons.contact_mail),
      MenuItemModel(
        title: "Log Out",
        icon: "assets/images/logout.png",
        onTap: () {
          _navigateToScreen(context, const AuthScreen());
        },
        color: Colors.red,
      ),
    ];

    String userName = "Equina User";

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextManager.bold()),
        centerTitle: true,
      ),
      body: Container(
        padding: SizeConfig.base,
        width: double.infinity,
        color: ColorManager.lightGrey.withAlpha(30),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/profile.png",
                    height: 80.h,
                    width: 80.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: SizeConfig.betweenH),
                  Text(userName, style: TextManager.medium()),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.betweenH),
            Card(
              child: _showList(menuItems),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  Widget _showList(List<MenuItemModel> menuItems) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        bool isImage = item.icon is String;
        Color itemColor = item.color ;

        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: itemColor,
              borderRadius: BorderRadius.circular(6),
            ),
            width: 31.w,
            height: 30.h,
            alignment: Alignment.center,
            child: isImage
                ? Image.asset(
              item.icon as String,
              height: 22.h,
              width: 22.w,
              fit: BoxFit.contain,
            )
                : Icon(item.icon as IconData, color: Colors.white, size: 24),
          ),
          title: Text(
            item.title,
            style: TextManager.regular(),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: item.onTap,
        );
      },
    );
  }
}
