import 'package:json_annotation/json_annotation.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news.dart';

import 'news_data_model.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends NewsEntity {
  final String? status;
  final String? copyright;
  final int? num_results;
  final List<NewsDataModel>? results;

  const NewsModel({
    this.status,
    this.copyright,
    this.num_results,
    this.results,
  });
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
