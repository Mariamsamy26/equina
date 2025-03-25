import 'package:equina/core/color_mang.dart';
import 'package:equina/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/size_config.dart';
import '../../core/text_mang.dart';
import '../../core/widgets/custom_elevated_button.dart';
import '../../core/widgets/custom_phone_form_field.dart';
import '../../core/widgets/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isChecked = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.lightGrey.withAlpha(20),
      padding: SizeConfig.base,
      child: Column(
        children: [
          _buildUserFields(),
          _agreed(),
          CustomElevatedButton(
            onPressed: () {
              _navigateToScreen(context,HomeScreen());
            },
            colorBorder: ColorManager.lightGrey.withAlpha(50),
            colorButton: ColorManager.lightGrey.withAlpha(50),
            content: Text(
              "Register",
              style: TextManager.medium().copyWith(color: ColorManager.lightGrey),
            ),
          ),
        ],
      ),
    );
  }
  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
  Widget _buildUserFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SizeConfig.betweenH),
        _buildLabel("Name"),
        AppTextFormField(
          controller: _nameController,
          hintText: "Name",
        ),
        SizedBox(height: SizeConfig.betweenH),

        _buildLabel("Phone Number"),
        AppPhoneFormField(
          controller: _phoneController,
          hintText: "Phone Number",
        ),
        SizedBox(height: 10.h),

        _buildLabel("Password"),
        _buildPasswordField(_passwordController, "Password"),

        SizedBox(height: 10.h),
        _buildLabel("Confirm Password"),
        _buildPasswordField(_confirmPasswordController, "Confirm Password"),
      ],
    );
  }
  Widget _agreed() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.0,
          child: Checkbox(
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value!;
              });
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
            activeColor: ColorManager.blue,
          ),
        ),
        Expanded(
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: TextStyle(fontSize: 14.sp, color: ColorManager.lightGrey),
              children: [
                TextSpan(text: "I have read and agreed to the "),
                TextSpan(
                    text: "Terms",
                    style: TextManager.regular().copyWith(
                      color: ColorManager.blue,
                      decoration: TextDecoration.underline,
                    )
                ),
                TextSpan(text: " and "),
                TextSpan(
                    text: "Privacy Policy",
                    style: TextManager.regular().copyWith(
                      color: ColorManager.blue,
                      decoration: TextDecoration.underline,
                    )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Text(text, style: TextManager.regular());
  }

  Widget _buildPasswordField(TextEditingController controller, String hintText) {
    return AppTextFormField(
      controller: controller,
      hintText: hintText,
      isPasswordField: true,
      suffixIcon: IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
