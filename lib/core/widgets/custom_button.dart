import 'package:flutter/material.dart';
import 'package:my_bookly/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.textColor = Colors.black,
    this.backGroundColor = Colors.white,
    this.borderRadius = const BorderRadius.only(),
    required this.text,
    this.onPressed,
  });

  final Color textColor;
  final Color backGroundColor;
  final BorderRadius borderRadius;
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        child: Text(
          text,
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
