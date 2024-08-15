import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/core/services/app_validators.dart';
import 'package:my_bookly/core/widgets/App_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.passwsordController,
  });

  final TextEditingController passwsordController;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      validator: (value) {
        return AppValidators.validatePassword(value);
      },
      hintText: 'Password',
      keyboardType: TextInputType.visiblePassword,
      controller: widget.passwsordController,
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
            color: Colors.white,
            size: 24.sp,
            obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
