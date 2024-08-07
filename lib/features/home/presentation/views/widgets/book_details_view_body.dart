import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'books_details_section.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsSection(
                bookModel: bookModel,
              ),
               Expanded(
                child: SizedBox(
                  height: 40.h,
                ),
              ),
              const SimilarBooksSection(),
               SizedBox(
                height: 18.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
