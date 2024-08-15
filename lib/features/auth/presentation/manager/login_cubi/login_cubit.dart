import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/features/auth/domain/repos/auth_repo.dart';
import 'package:my_bookly/features/auth/presentation/manager/login_cubi/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> singInwithEmailAndPassword() async {
    emit(
      LoginLoading(),
    );
    var result = await authRepo.singInwithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) {
        emit(
          LoginFailure(errMessage: failure.errorMessage),
        );
      },
      (user) {
        emit(
          LoginSuccess(user: user),
        );
      },
    );
  }
}
