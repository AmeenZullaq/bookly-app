import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';
import 'result_search_list_view.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  Widget build(BuildContext context) {
    SearchBooksCubit searchBooksCubit = context.read<SearchBooksCubit>();
    return Form(
      key: searchBooksCubit.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Expanded(
                    child: CustomSearchTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'field is required';
                        } else {
                          return null;
                        }
                      },
                      searchController: searchBooksCubit.searchController,
                      onPressed: () {
                        if (searchBooksCubit.formKey.currentState!.validate()) {
                          BlocProvider.of<SearchBooksCubit>(context)
                              .fetchSearchBooks();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Text(
                'Search Result',
                style: Styles.textStyle18,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            const Expanded(
              child: ResultSearchListView(),
            ),
          ],
        ),
      ),
    );
  }
}
