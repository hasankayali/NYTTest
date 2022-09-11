import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailWidget extends StatelessWidget {
  final String title;
  final String value;

  const NewsDetailWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: RichText(
        maxLines: 3,
        text: TextSpan(children: [
          TextSpan(
            text: title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Colors.black),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
                color: Colors.black),
          ),
        ]),
      ),
    );
  }
}
