import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:equina/core/color_mang.dart';
import '../size_config.dart';

class AppPhoneFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? colorBorder;

  const AppPhoneFormField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.hintStyle,
    this.colorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.betweenH),
      child: IntlPhoneField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          hintStyle: hintStyle,
          labelStyle: TextStyle(color: colorBorder),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorBorder ?? ColorManager.lightGrey,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        initialCountryCode: 'AE',
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9*#]')),
        ],
        keyboardType: TextInputType.phone,
        onChanged: (phone) {
          print("Full Phone Number: ${phone.completeNumber}");
          print("Phone Number Only: ${phone.number}");
        },
      ),
    );
  }
}
