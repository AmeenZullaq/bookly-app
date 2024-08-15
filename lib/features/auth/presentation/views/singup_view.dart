import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/services/service_locator.dart';
import 'package:my_bookly/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:my_bookly/features/auth/presentation/manager/singup_cubit/singup_cubit.dart';
import 'package:my_bookly/features/auth/presentation/views/widgets/singup_view_body_bloc.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingUpCubit(
        getIt.get<AuthRepoImpl>(),
      ),
      child: const Scaffold(
        body: SafeArea(
          child: SingupViewBodyBloc(),
        ),
      ),
    );
  }
}
