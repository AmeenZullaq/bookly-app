import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/services/shared_preferences.dart';
import 'package:my_bookly/features/auth/domain/repos/auth_repo.dart';
import 'package:my_bookly/features/auth/presentation/manager/singup_cubit/singup_state.dart';

class SingUpCubit extends Cubit<SingUpState> {
  SingUpCubit(this.authRepo) : super(SingUpInitial());

  final AuthRepo authRepo;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isTermsAccepted = false;

  Future<void> singUp() async {
    emit(
      SingUpLoading(),
    );
    var result = await authRepo.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) {
        if (failure.errorMessage.toString().contains(Prefs.getString(kError))) {
          emit(
            CustomSingUpSuccess(),
          );
        } else {
          emit(
            SingUpFailure(errMessage: failure.errorMessage),
          );
        }
      },
      (user) {
        emit(
          SingUpSuccess(user: user),
        );
      },
    );
  }
}
