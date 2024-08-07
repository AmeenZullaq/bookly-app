import 'package:flutter/material.dart';
import 'package:my_bookly/core/widgets/App_text_form_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: TextEditingController(),
      keyboardType: TextInputType.emailAddress,
      hintText: 'Email',
    );
  }
}
