import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:equina/core/color_mang.dart';

import '../size_config.dart';

class AppTextFormField extends StatefulWidget {
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final String? label;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final Color? colorBorder;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPasswordField;

  const AppTextFormField({
    super.key,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.label,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
    this.colorBorder,
    this.isPasswordField = false,
  });

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeConfig.bettwenH),
      child: TextFormField(
        readOnly: widget.readOnly,
        obscureText: widget.isPasswordField ? !_isPasswordVisible : false,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          suffixIcon:
              widget.isPasswordField
                  ? IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: ColorManager.lightGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  )
                  : widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          border:
              widget.enabledBorder ??
              OutlineInputBorder(
                borderSide: BorderSide(
                  color: widget.colorBorder ?? ColorManager.lightGrey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
        ),
        controller: widget.controller,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
      ),
    );
  }
}
