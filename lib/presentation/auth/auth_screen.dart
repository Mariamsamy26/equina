import 'package:equina/core/color_mang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/size_config.dart';
import '../../core/text_mang.dart';
import '../../core/widgets/custom_tabview .dart';
import 'RegisterForm.dart';
import 'SignInForm.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = 'Auth Screen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _ConstPart(),
          CustomTabView(
            tabs: ["Sign In", "Register"],
            views: [SignInForm(), RegisterForm()],
          ),
        ],
      ),
    );
  }

  Widget _ConstPart() {
    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo_text.png",
            height: 50.h,
            width: 200.w,
            fit: BoxFit.fill,
          ),
          SizedBox(height: SizeConfig.betweenH),
          Text("Welcon to equina ", style: TextManager.bold()),
          Text(
            "equinaCLUB, book your ",
            style: TextManager.regular().copyWith(
              color: ColorManager.lightGrey,
            ),
          ),
          Text(
            "classes - advance your game. ",
            style: TextManager.regular().copyWith(
              color: ColorManager.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
