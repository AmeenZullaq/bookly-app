import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/functions/custom_snack_bar.dart';
import 'package:my_bookly/features/auth/presentation/manager/login_cubi/login_cubit.dart';
import 'package:my_bookly/features/auth/presentation/manager/login_cubi/login_state.dart';
import 'package:my_bookly/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginViewBodyBloc extends StatelessWidget {
  const LoginViewBodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).pushReplacement(
            AppRouter.kInterestBookView,
          );
        }
        if (state is LoginFailure) {
          customSnackBar(
            context,
            state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
