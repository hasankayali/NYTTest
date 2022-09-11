import 'package:built_value/built_value.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news.dart';

part 'news_state.g.dart';

abstract class NewsState implements Built<NewsState, NewsStateBuilder> {
  bool get isLoading;
  bool get isSuccess;
  bool get isSearch;
  bool get isChanged;
  String get errorMessage;
  NewsEntity get newsEntity;
  NewsEntity get newsResult;

  NewsState._();

  factory NewsState([Function(NewsStateBuilder b) updates]) = _$NewsState;

  factory NewsState.initial() {
    return NewsState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isSearch = false
      ..isChanged = false
      ..errorMessage = ''
      ..newsEntity =
          NewsEntity(status: "", copyright: "", num_results: 0, results: [])
      ..newsResult =
          NewsEntity(status: "", copyright: "", num_results: 0, results: []));
  }
}
