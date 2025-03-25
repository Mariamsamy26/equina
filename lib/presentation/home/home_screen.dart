import 'package:equina/core/color_mang.dart';
import 'package:flutter/material.dart';
import '../../core/size_config.dart';
import '../../core/text_mang.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home Screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> actionsData = [
      //family
      {
        'icon': "assets/images/family.png",
        'onPressed': () {},
        'isContainer': true,
      },

      //notification
      {
        'icon': "assets/images/notification.png",
        'onPressed': () {},
        'isContainer': false,
      },

      //profile
      {
        'icon': "assets/images/profile.png",
        'onPressed': () => _navigateToScreen(context, const ProfileScreen()),
        'isContainer': false,
      },
    ];

    List<Widget> _actions = [];
    for (var action in actionsData) {
      _actions.add(
        IconButton(
          onPressed: action['onPressed'],
          icon: action['isContainer']
              ? Container(
            color: ColorManager.lightGrey,
            width: 30,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset(
                action['icon'],
                width: 19,
                height: 19,
                fit: BoxFit.cover,
              ),
            ),
          )
              : Image.asset(
            action['icon'],
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/horse.png"),
        ),
        title: Text("equinaCLUB", style: TextManager.bold()),
        actions: _actions,
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
}
