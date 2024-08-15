import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bookly/core/utils/styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    this.onChanged,
    this.onPressed,
    this.validator,
    required this.searchController,
  });
  final Function(String)? onChanged;
  final Function()? onPressed;
  final String? Function(String?)? validator;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: Styles.textStyle14.copyWith(
          color: Colors.white,
        ),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: const Opacity(
            opacity: .8,
            child: Icon(
              Icons.search,
              size: 22,
              color: Colors.white,
            ),
          ),
        ),
        enabledBorder: outLineInputBorder(),
        focusedBorder: outLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outLineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12.r),
    );
  }
}
