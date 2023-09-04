import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/core/widgets/custom_error_widget.dart';
import 'package:my_bookly/core/widgets/custom_loading_indecator.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          List<BookModel> books = state.books;
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomBookImage();
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: 10,
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
