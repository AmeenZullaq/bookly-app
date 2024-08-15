import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: Styles.textStyle14,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushReplacement(
              AppRouter.kLoginView,
            );
          },
          child: Text(
            'Login',
            style: Styles.textStyle18.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
