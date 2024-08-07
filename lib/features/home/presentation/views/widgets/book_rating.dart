import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.averageRating,
    required this.ratingCount,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num averageRating;
  final int ratingCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          size: 14.sp,
          color: const Color(0xffFFDD4F),
        ),
        SizedBox(
          width: 6.3.w,
        ),
        Text(
          averageRating.toString(),
          style: Styles.textStyle16,
        ),
        SizedBox(
          width: 5.w,
        ),
        Opacity(
          opacity: .5,
          child: Text(
            '($ratingCount)',
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
