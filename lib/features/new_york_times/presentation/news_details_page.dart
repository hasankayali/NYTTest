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
          style: TextStyle(fontWeight: FontWeight.normal),
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
            if (newsDataEntity.abstract != null &&
                newsDataEntity.abstract!.isNotEmpty)
              Column(
                children: [
                  NewsDetailWidget(
                    title: "Abstract ",
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                    value: newsDataEntity.abstract ?? "",
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                    thickness: 1,
                  ),
                ],
              ),
            if (newsDataEntity.media != null &&
                newsDataEntity.media!.isNotEmpty)
              Column(
                children: [
                  NewsDetailWidget(
                    title: "Caption ",
                    textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                    value: newsDataEntity.media!.first.caption ?? "",
                  ),
                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                    thickness: 1,
                  ),
                ],
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Text(
                "Details",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (newsDataEntity.byline != null &&
                    newsDataEntity.byline!.isNotEmpty)
                  Expanded(
                    child: NewsDetailWidget(
                      title: "By: ",
                      value: newsDataEntity.byline ?? "",
                    ),
                  ),
                if (newsDataEntity.source != null &&
                    newsDataEntity.source!.isNotEmpty)
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
                if (newsDataEntity.published_date != null &&
                    newsDataEntity.published_date!.isNotEmpty)
                  Expanded(
                    child: NewsDetailWidget(
                      title: "Published at: ",
                      value: newsDataEntity.published_date ?? "",
                    ),
                  ),
                if (newsDataEntity.updated != null &&
                    newsDataEntity.updated!.isNotEmpty)
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
                if (newsDataEntity.section != null &&
                    newsDataEntity.section!.isNotEmpty)
                  Expanded(
                    child: NewsDetailWidget(
                      title: "Section: ",
                      value: newsDataEntity.section ?? "",
                    ),
                  ),
                if (newsDataEntity.type != null &&
                    newsDataEntity.type!.isNotEmpty)
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
            if (newsDataEntity.des_facet != null &&
                newsDataEntity.des_facet!.isNotEmpty)
              NewsDetailWidget(
                title: "Tags: ",
                value: newsDataEntity.des_facet.toString().substring(
                    1, newsDataEntity.des_facet.toString().length - 1),
              ),
            Divider(
              color: Theme.of(context).colorScheme.secondary,
              thickness: 1,
            ),
            if (newsDataEntity.url != null && newsDataEntity.url!.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: RichText(
                  maxLines: 3,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "Link to full article ",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp),
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
