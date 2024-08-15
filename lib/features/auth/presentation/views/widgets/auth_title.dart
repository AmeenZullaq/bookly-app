import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/core/utils/assets.dart';
import 'package:my_bookly/core/utils/styles.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Image.asset(
          width: MediaQuery.sizeOf(context).height * .4,
          height: MediaQuery.sizeOf(context).height * .15,
          AssetsData.logo,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Book Shope',
          style: Styles.textStyle20,
        ),
      ],
    );
  }
}
