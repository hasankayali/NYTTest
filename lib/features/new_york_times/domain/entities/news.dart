import 'package:equatable/equatable.dart';

import 'news_data.dart';

class NewsEntity extends Equatable {
  final String? status;
  final String? copyright;
  final int? num_results;
  final List<NewsDataEntity>? results;

  const NewsEntity({
    this.status,
    this.copyright,
    this.num_results,
    this.results,
  });

  @override
  List<Object?> get props => [];
}
