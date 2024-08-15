import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/utils/functions/custom_snack_bar.dart';
import 'package:my_bookly/core/widgets/custom_error_widget.dart';
import 'package:my_bookly/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/featured_shimmer_book.dart';

class FeaturedListViewBloc extends StatefulWidget {
  const FeaturedListViewBloc({super.key});

  @override
  State<FeaturedListViewBloc> createState() => _FeaturedListViewBlocState();
}

class _FeaturedListViewBlocState extends State<FeaturedListViewBloc> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          customSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const FeaturedShimmerList();
        }
      },
    );
  }
}
