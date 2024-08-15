import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/newest_books_list_view_bloc.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'featured_list_view_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController scrollController;
  int pageNumber = 1;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    double currentPosition = scrollController.position.pixels;
    double maxScrollExtent = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxScrollExtent) {
      context.read<NewestBooksCubit>().fetchNewestBooks(
            pageNumber: pageNumber++,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              const CustomAppBar(),
              const FeaturedListViewBloc(),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 30.w),
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 30.w,
              bottom: 16.h,
            ),
            child: const NewestBooksListViewBloc(),
          ),
        ),
      ],
    );
  }
}
