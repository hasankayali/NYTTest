import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/news_data.dart';
import '../news_details_page.dart';

class NewsCard extends StatelessWidget {
  final NewsDataEntity newsData;

  const NewsCard({
    Key? key,
    required this.newsData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return NewsDetailsPage(newsDataEntity: newsData);
          },
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: newsData.media!.isNotEmpty &&
                      newsData.media!
                              .where((element) => element.type == "image")
                              .first
                              .metadata !=
                          null
                  ? CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(newsData.media!
                          .where((element) => element.type == "image")
                          .first
                          .metadata!
                          .first
                          .url!),
                    )
                  : CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey,
                    ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 3,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsData.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsData.byline ?? "",
                          style: const TextStyle(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.grey,
                              size: 16.sp,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(newsData.published_date ?? "",
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54,
                    size: 16.sp,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
