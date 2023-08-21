import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.only(
        start: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedListView(),
          SizedBox(
            height: 30,
          ),
          Text(
            'Best Seller',
            style: Styles.textStyle18,
          ),
        ],
      ),
    );
  }
}
