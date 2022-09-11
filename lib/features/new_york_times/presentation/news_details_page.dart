import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news_data.dart';
import 'package:nytimestest/features/new_york_times/presentation/widget/news_detail_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsDataEntity newsDataEntity;

  const NewsDetailsPage({Key? key, required this.newsDataEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          newsDataEntity.title ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (newsDataEntity.media != null &&
                newsDataEntity.media!.isNotEmpty &&
                newsDataEntity.media!.first.metadata != null &&
                newsDataEntity.media!.first.metadata!.isNotEmpty)
              Image.network(
                  newsDataEntity.media!.first.metadata!.last.url ?? ""),
            SizedBox(
              height: 20.h,
            ),
            NewsDetailWidget(
              title: "Abstract: ",
              value: newsDataEntity.abstract ?? "",
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
            if (newsDataEntity.media != null &&
                newsDataEntity.media!.isNotEmpty)
              NewsDetailWidget(
                title: "Caption: ",
                value: newsDataEntity.media!.first.caption ?? "",
              ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Text(
                "Details",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: NewsDetailWidget(
                    title: "By: ",
                    value: newsDataEntity.byline ?? "",
                  ),
                ),
                Expanded(
                  child: NewsDetailWidget(
                    title: "source: ",
                    value: newsDataEntity.source ?? "",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: NewsDetailWidget(
                    title: "Published at: ",
                    value: newsDataEntity.published_date ?? "",
                  ),
                ),
                Expanded(
                  child: NewsDetailWidget(
                    title: "updated at: ",
                    value: newsDataEntity.updated ?? "",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: NewsDetailWidget(
                    title: "Section: ",
                    value: newsDataEntity.section ?? "",
                  ),
                ),
                Expanded(
                  child: NewsDetailWidget(
                    title: "Type: ",
                    value: newsDataEntity.type ?? "",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            NewsDetailWidget(
              title: "Tags: ",
              value: newsDataEntity.des_facet
                  .toString()
                  .substring(1, newsDataEntity.des_facet.toString().length - 1),
            ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: RichText(
                maxLines: 3,
                text: TextSpan(children: [
                  TextSpan(
                    text: "Link to full article: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.black),
                  ),
                  WidgetSpan(
                    child: InkWell(
                        onTap: () {
                          if (newsDataEntity.url != null &&
                              newsDataEntity.url!.isNotEmpty) {
                            launchUrlString(newsDataEntity.url!);
                          }
                        },
                        child: Text(
                          newsDataEntity.url ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16.sp,
                              color: Colors.blue),
                        )),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
