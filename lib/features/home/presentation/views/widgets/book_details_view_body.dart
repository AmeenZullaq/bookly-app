import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/styles.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'similsr_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .3,
          child: const CustomBookImage(),
        ),
        const SizedBox(
          height: 43,
        ),
        const Text(
          'The Jungle Book',
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        const BooksAction(),
        const SizedBox(
          height: 50,
        ),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 30,
            ),
            child: Text(
              'You can also like',
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListView(),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
