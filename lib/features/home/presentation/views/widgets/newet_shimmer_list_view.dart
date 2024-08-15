import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class NewestShimmerListView extends StatelessWidget {
  const NewestShimmerListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 20.h,
        );
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsDirectional.only(end: 20.w),
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .17,
                child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: Shimmer.fromColors(
                    baseColor: const Color(0xff1A142B),
                    highlightColor: const Color(0xff433D54),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: const Color(0xff1A142B),
                      highlightColor: const Color(0xff433D54),
                      child: Container(
                        height: 10.h,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: const Color(0xff1A142B),
                      highlightColor: const Color(0xff433D54),
                      child: Container(
                        height: 10.h,
                        width: MediaQuery.sizeOf(context).width * .5,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Shimmer.fromColors(
                      baseColor: const Color(0xff1A142B),
                      highlightColor: const Color(0xff433D54),
                      child: Container(
                        height: 10.h,
                        width: MediaQuery.sizeOf(context).width * .3,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
