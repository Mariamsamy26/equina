import 'package:equina/core/color_mang.dart';
import 'package:flutter/material.dart';
import '../core/text_mang.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home Screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/horse.png"),
        ),
        title: Text("equinaCLUB", style: TextManager.bold()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              color: ColorManager.lightGrey,
              width: 30,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset(
                  "assets/images/family.png",
                  width: 19,
                  height: 19,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/notification.png",
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/profile.png",
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
