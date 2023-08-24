import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/custom_book_image.dart';

import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        SizedBox(
          height: MediaQuery.of(context).size.height * .35,
          child: const CustomBookImage(),
        ),
      ],
    );
  }
}
