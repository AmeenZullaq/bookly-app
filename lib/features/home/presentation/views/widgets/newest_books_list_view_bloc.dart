import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/utils/functions/custom_snack_bar.dart';
import 'package:my_bookly/core/widgets/custom_error_widget.dart';
import 'package:my_bookly/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/newet_shimmer_list_view.dart';

class NewestBooksListViewBloc extends StatefulWidget {
  const NewestBooksListViewBloc({super.key});

  @override
  State<NewestBooksListViewBloc> createState() =>
      _NewestBooksListViewBlocState();
}

class _NewestBooksListViewBlocState extends State<NewestBooksListViewBloc> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is NewestBooksPageinationFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPageinationLoading ||
            state is NewestBooksPageinationFailure) {
          return NewestBooksListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const NewestShimmerListView();
        }
      },
    );
  }
}
