import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/functions/custom_launch_url.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 38.w,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              text: 'Free',
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                topLeft: Radius.circular(16.r),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () {
                customLaunchUrl(context, bookModel.volumeInfo.previewLink);
              },
              text: getText(bookModel),
              backGroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String getText(BookModel bookModel) {
  if (bookModel.volumeInfo.previewLink == null) {
    return 'Not Available';
  } else {
    return 'Preview';
  }
}
