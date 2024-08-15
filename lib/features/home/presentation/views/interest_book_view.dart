import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/core/utils/styles.dart';
import 'package:my_bookly/core/widgets/app_text_form_field.dart';
import 'package:my_bookly/core/widgets/custom_button.dart';
import 'package:my_bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';

class InterestBookView extends StatefulWidget {
  const InterestBookView({super.key});

  @override
  State<InterestBookView> createState() => _InterestBookViewState();
}

class _InterestBookViewState extends State<InterestBookView> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = context.read<SimilarBooksCubit>().controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Text(
              'What is your main',
              style: Styles.textStyle30,
            ),
            Text(
              'interest in books?',
              style: Styles.textStyle30,
            ),
            const Spacer(
              flex: 2,
            ),
            AppTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'field is required';
                } else {
                  return null;
                }
              },
              hintText: 'Enter your main field of books',
              controller: controller,
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
              onPressed: () {
                context.read<FeaturedBooksCubit>().category = controller.text;
                context.read<NewestBooksCubit>().category = controller.text;
                context
                    .read<FeaturedBooksCubit>()
                    .fetchFeaturedBooks(pageNumber: 0);
                context
                    .read<NewestBooksCubit>()
                    .fetchNewestBooks(pageNumber: 0);
                GoRouter.of(context).pushReplacement(
                  AppRouter.kHomeView,
                );
              },
              text: 'Search Now',
              textColor: Colors.white,
              backGroundColor: Colors.blue,
              borderRadius: BorderRadius.circular(16.r),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
