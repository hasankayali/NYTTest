import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailWidget extends StatelessWidget {
  final String title;
  final String value;
  TextStyle? textStyle;

  NewsDetailWidget({
    Key? key,
    required this.title,
    required this.value,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle ??
                TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.black),
          ),
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,
                color: Colors.black),
          ),
        ],
      ),
    );
  }
}
