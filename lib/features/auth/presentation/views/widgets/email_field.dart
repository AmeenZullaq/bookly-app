import 'package:flutter/material.dart';
import 'package:my_bookly/core/services/app_validators.dart';
import 'package:my_bookly/core/widgets/App_text_form_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.emailController,
  });
  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      validator: (value) {
        return AppValidators.validateEmail(value);
      },
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      hintText: 'Email',
    );
  }
}
