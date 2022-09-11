import 'package:equatable/equatable.dart';

import '../../data/models/news_data_model.dart';

class NewsEntity extends Equatable {
  final String? status;
  final String? copyright;
  final int? num_results;
  List<NewsDataModel>? results;

  NewsEntity({
    this.status,
    this.copyright,
    this.num_results,
    this.results,
  });

  @override
  List<Object?> get props => [];
}
