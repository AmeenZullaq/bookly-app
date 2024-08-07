import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/utils/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    required this.controller,
    this.validator,
    this.obscureText = false,
  });
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(
          bottom: 16.h,
          top: 16.h,
          start: 16.w,
        ),
        fillColor: kPrimaryColor,
        filled: true,
        hintText: hintText,
        hintStyle: Styles.textStyle16,
        suffixIcon: suffixIcon,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        errorBorder: errorBorder,
        focusedErrorBorder: errorBorder,
      ),
    );
  }
}

OutlineInputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.r),
  borderSide: const BorderSide(color: Colors.blue),
);
OutlineInputBorder errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.r),
  borderSide: const BorderSide(
    color: Colors.red,
  ),
);
