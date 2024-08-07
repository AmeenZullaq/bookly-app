import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/custom_book_image.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BooksListViewItem extends StatelessWidget {
  const BooksListViewItem({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 20.w),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.kBookDetailsView,
            extra: bookModel,
          );
        },
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .17,
              child: CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
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
                    bookModel.volumeInfo.title!,
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
                    bookModel.volumeInfo.authors?[0] ?? '',
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
                        averageRating: bookModel.volumeInfo.averageRating ?? 0,
                        ratingCount: bookModel.volumeInfo.ratingsCount ?? 0,
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
