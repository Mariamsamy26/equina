import 'package:equina/core/color_mang.dart';
import 'package:equina/core/size_config.dart';
import 'package:equina/core/text_mang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_phone_form_field.dart';
import '../../core/widgets/custom_selec_user_button.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../home/home_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = true;
  String userType = "Equestrian User";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.lightGrey.withAlpha(20),
      padding: SizeConfig.base,
      child: Column(
        children: [
          _UsersType(),
          _UsersData(),
          Positioned(
            right: 0,
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "or logIn ",
                      style: TextManager.regular().copyWith(
                        color: ColorManager.lightGrey,
                        fontSize: 13.sp,
                      ),
                      children: [
                        TextSpan(
                          text: "As a Guest",
                          style: TextManager.regular().copyWith(
                            color: ColorManager.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorManager.blue,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget password?",
                      style: TextManager.medium().copyWith(
                        color: ColorManager.blue,
                        fontSize: 11.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          CustomElevatedButton(
            onPressed: () {
              _navigateToScreen(context,HomeScreen());
            },
            colorBorder: ColorManager.blue,
            colorButton: ColorManager.blue,
            content: Text(
              "Sign in",
              style: TextManager.medium().copyWith(color: ColorManager.white),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
  Widget _UsersType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UsersTypeButton(
          onPressed: () {
            setState(() {
              userType = "Equestrian User";
            });
          },
          select: userType == "Equestrian User",
          user: "Equestrian User",
        ),
        UsersTypeButton(
          onPressed: () {
            setState(() {
              userType = "Trainer User";
            });
          },
          select: userType == "Trainer User",
          user: "Trainer User",
        ),
      ],
    );
  }

  Widget _UsersData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeConfig.betweenH),
        Text("Phone Number", style: TextManager.regular()),
        AppPhoneFormField(
          controller: _phoneController,
          hintText: "Phone Number",
        ),

        SizedBox(height: 10.h),
        Text("Password", style: TextManager.regular()),
        AppTextFormField(
          controller: _passwordController,
          hintText: "password",
          isPasswordField: _isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
