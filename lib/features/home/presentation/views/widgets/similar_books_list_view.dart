import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/core/widgets/custom_loading_indecator.dart';
import 'package:my_bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';

import 'custom_book_image.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: 30.w,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                            '',
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
                itemCount: state.books.length,
              ),
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return ErrorWidget(state.errMessage);
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
