import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indecator.dart';
import '../../manager/search_books_cubit/search_books_cubit.dart';

class ResultSearchListView extends StatelessWidget {
  const ResultSearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<SimilarBooksCubit>().fetchSimilarBooks(
                        category: context
                            .read<SearchBooksCubit>()
                            .searchController
                            .text,
                      );
                },
                child: BooksListViewItem(bookEntity: state.books[index]),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.h,
              );
            },
            itemCount: state.books.length,
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchBooksLoading) {
          return const CustomLoadingIndecator();
        } else {
          return const Expanded(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
