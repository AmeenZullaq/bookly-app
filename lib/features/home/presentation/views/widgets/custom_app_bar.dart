import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: 30,
        top: 30,
        end: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            height: 18,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
