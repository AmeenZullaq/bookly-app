import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/assets.dart';
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
          SizedBox(
            height: 10,
          ),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 30),
      child: Row(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: AspectRatio(
              aspectRatio: 1.3 / 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AssetsData.testImage,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Harry Potter and the Goblet of Fire',
                ),
                Text(
                  'J.K.Rowling',
                ),
                Row(
                  children: [
                    Text(
                      '19.99 \u{20AC}',
                    ),
                    Spacer(),
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.yellow,
                    ),
                    Text('4.8 (2390)')
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
