import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/core/widgets/App_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      hintText: 'Password',
      keyboardType: TextInputType.visiblePassword,
      controller: TextEditingController(),
      obscureText: obscureText,
      suffixIcon: Padding(
        padding: EdgeInsetsDirectional.only(end: 16.w),
        child: GestureDetector(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
