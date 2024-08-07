import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/core/utils/assets.dart';
import 'package:my_bookly/core/utils/styles.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';
import 'package:my_bookly/features/auth/presentation/views/wisgets/email_field.dart';
import 'package:my_bookly/features/auth/presentation/views/wisgets/password_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          width: MediaQuery.sizeOf(context).height * .4,
          height: MediaQuery.sizeOf(context).height * .15,
          AssetsData.logo,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Book Shope',
          style: Styles.textStyle20,
        ),
        SizedBox(
          height: 30.h,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'Login',
            style: Styles.textStyle20,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        const EmailField(),
        SizedBox(
          height: 16.h,
        ),
        const PasswordField(),
        SizedBox(
          height: 30.h,
        ),
        CustomButton(
          text: 'Login',
          backGroundColor: Colors.blue,
          textColor: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account? ',
              style: Styles.textStyle14,
            ),
            Text(
              'Craete One',
              style: Styles.textStyle18.copyWith(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
