import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String searchName;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'field is required';
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                searchName = value;
              },
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<SearchBooksCubit>(context)
                      .fetchSearchBooks(searchName: searchName);
                }
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Search Result',
              style: Styles.textStyle18,
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
