import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/core/utils/styles.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';
import 'package:my_bookly/features/auth/presentation/manager/login_cubi/login_cubit.dart';
import 'package:my_bookly/features/auth/presentation/views/widgets/auth_title.dart';
import 'package:my_bookly/features/auth/presentation/views/widgets/dont_have_account.dart';
import 'package:my_bookly/features/auth/presentation/views/widgets/email_field.dart';
import 'package:my_bookly/features/auth/presentation/views/widgets/password_field.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();
    return Form(
      key: loginCubit.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              const AuthTitle(),
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
              EmailField(
                emailController: loginCubit.emailController,
              ),
              SizedBox(
                height: 16.h,
              ),
              PasswordField(
                passwsordController: loginCubit.passwordController,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                onPressed: () {},
                text: 'Login',
                backGroundColor: Colors.blue,
                textColor: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              SizedBox(
                height: 16.h,
              ),
              const DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
