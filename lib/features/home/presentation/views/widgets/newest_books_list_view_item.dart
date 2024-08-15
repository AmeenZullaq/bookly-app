import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({
    super.key,
    required this.bookEntity,
  });

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 20.w),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
              category: context.read<NewestBooksCubit>().category);
          GoRouter.of(context).push(
            AppRouter.kBookDetailsView,
            extra: bookEntity,
          );
        },
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .17,
              child: CustomBookImage(
                imageUrl: bookEntity.image ?? '',
              ),
            ),
            SizedBox(
              width: 30.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookEntity.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGtSectraFine,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    bookEntity.authorName ?? '',
                    style: Styles.textStyle14,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      BookRating(
                        averageRating: bookEntity.rating ?? 0,
                        ratingCount: bookEntity.ratingsCount ?? 0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
