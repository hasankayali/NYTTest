import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nytimestest/features/new_york_times/presentation/bloc/news_bloc.dart';
import 'package:nytimestest/features/new_york_times/presentation/bloc/news_state.dart';
import 'package:nytimestest/features/new_york_times/presentation/widget/news_card.dart';

import '../../../injection.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsBloc bloc = sl<NewsBloc>();
  List<String> periods = [
    "Choose Listed news period",
    "1 day",
    "7 days",
    "30 days"
  ];
  String selectedPeriod = "7 days";
  @override
  void initState() {
    bloc.onGetNews(7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state.isSearch
                ? TextField(
                    textInputAction: TextInputAction.search,
                    onChanged: (value) {
                      print(value);
                      bloc.onSearchNewsEvent(value);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.r, vertical: 0),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.r)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.r)),
                    ),
                  )
                : Text("NY Times Most Popular",
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
            centerTitle: true,
            actions: [
              InkWell(
                  onTap: () {
                    bloc.onChangeIsSearch();
                    bloc.onSearchNewsEvent("");
                  },
                  child: Icon(state.isSearch ? Icons.close : Icons.search)),
              !state.isSearch
                  ? PopupMenuButton(
                      itemBuilder: (context) {
                        return periods
                            .map((value) => PopupMenuItem(
                                enabled:
                                    value.contains("Choose") ? false : true,
                                onTap: () {
                                  selectedPeriod = value;
                                  bloc.onGetNews(
                                      int.tryParse(value.split(" ")[0]) ?? 7);
                                },
                                child: Text(
                                  value,
                                  style: TextStyle(
                                      color: value == selectedPeriod
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                          : Colors.black),
                                )))
                            .toList();
                      },
                    )
                  : SizedBox(
                      width: 15.w,
                    )
            ],
          ),
          body: ModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: ListView.builder(
              itemCount: state.newsResult.results!.length,
              itemBuilder: (context, index) {
                return NewsCard(newsData: state.newsResult.results![index]);
              },
            ),
          ),
        );
      },
    );
  }
}
