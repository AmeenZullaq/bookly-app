import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/functions/custom_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_bookly/features/auth/presentation/manager/singup_cubit/singup_cubit.dart';
import 'package:my_bookly/features/auth/presentation/manager/singup_cubit/singup_state.dart';
import 'package:my_bookly/features/auth/presentation/views/widgets/singup_view_body.dart';

class SingupViewBodyBloc extends StatelessWidget {
  const SingupViewBodyBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingUpCubit, SingUpState>(
      listener: (context, state) {
        if (state is SingUpSuccess || state is CustomSingUpSuccess) {
          GoRouter.of(context).pushReplacement(
            AppRouter.kInterestBookView,
          );
        }
        if (state is SingUpFailure) {
          customSnackBar(
            context,
            state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SingUpLoading ? true : false,
          child: const SingupViewBody(),
        );
      },
    );
  }
}
