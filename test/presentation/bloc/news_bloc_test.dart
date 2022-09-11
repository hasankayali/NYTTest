import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nytimestest/core/constants/api_constant.dart';
import 'package:nytimestest/core/constants/failure.dart';
import 'package:nytimestest/features/new_york_times/data/models/news_data_model.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news_data.dart';
import 'package:nytimestest/features/new_york_times/domain/usecases/get_news.dart';
import 'package:nytimestest/features/new_york_times/presentation/bloc/news_bloc.dart';
import 'package:nytimestest/features/new_york_times/presentation/bloc/news_events.dart';
import 'package:nytimestest/features/new_york_times/presentation/bloc/news_state.dart';

import 'news_bloc_test.mocks.dart';

@GenerateMocks([GetNews])
void main() {
  late MockGetNews mockGetCurrentNews;
  late NewsBloc newsBloc;

  setUp(() {
    mockGetCurrentNews = MockGetNews();
    newsBloc = NewsBloc(getNews: mockGetCurrentNews);
  });

  NewsEntity tNews = NewsEntity(
      num_results: 10, copyright: "test", status: "true", results: []);

  blocTest<NewsBloc, NewsState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetCurrentNews.call(any)).thenAnswer((_) async => Right(tNews));
      return newsBloc;
    },
    act: (bloc) => bloc.add(GetNewsEvent(7)),
    wait: const Duration(milliseconds: 500),
    expect: () {
      List<NewsDataEntity>? temp = [];
      return [
        NewsState(
          (b) => b
            ..isLoading = true
            ..isSuccess = false
            ..isSearch = false
            ..isChanged = false
            ..newsEntity = NewsEntity(
                status: "", copyright: "", num_results: 0, results: [])
            ..newsResult = NewsEntity(
                status: "", copyright: "", num_results: 0, results: [])
            ..errorMessage = '',
        ),
        newsBloc.state
      ];
    },
    verify: (bloc) {
      verifyNever(mockGetCurrentNews.call(Params(7)));
    },
  );

  blocTest<NewsBloc, NewsState>(
    'should emit [loading, error] when get data is unsuccessful',
    build: () {
      when(mockGetCurrentNews.call(any))
          .thenAnswer((_) async => const Left(ServerFailure(Er.error)));
      return newsBloc;
    },
    act: (bloc) => bloc.onGetNews(7),
    wait: const Duration(milliseconds: 500),
    expect: () {
      return [
        NewsState(
          (b) => b
            ..isLoading = true
            ..isSuccess = false
            ..isSearch = false
            ..isChanged = false
            ..newsResult = newsBloc.state.newsResult
            ..errorMessage = ''
            ..newsEntity = NewsEntity(
                status: "", copyright: "", num_results: 0, results: []),
        ),
        NewsState(
          (b) => b
            ..isLoading = false
            ..isSuccess = false
            ..isSearch = false
            ..isChanged = false
            ..newsResult = newsBloc.state.newsResult
            ..errorMessage = Er.error
            ..newsEntity = NewsEntity(
                status: "", copyright: "", num_results: 0, results: []),
        ),
      ];
    },
    verify: (bloc) {
      verifyNever(mockGetCurrentNews.call(Params(7)));
    },
  );
  blocTest<NewsBloc, NewsState>(
    'should emit search result',
    build: () {
      return newsBloc;
    },
    seed: () => NewsState(
      (b) => b
        ..isLoading = false
        ..isSuccess = false
        ..isSearch = false
        ..isChanged = false
        ..errorMessage = ''
        ..newsEntity = NewsEntity(
            status: "",
            copyright: "",
            num_results: 0,
            results: [NewsDataModel(id: 0, title: "te", abstract: "queen")])
        ..newsResult =
            NewsEntity(status: "", copyright: "", num_results: 0, results: []),
    ),
    act: (bloc) => bloc.onSearchNewsEvent("qu"),
    expect: () => [
      NewsState(
        (b) => b
          ..isLoading = false
          ..isSuccess = false
          ..isSearch = false
          ..isChanged = true
          ..errorMessage = ''
          ..newsEntity = NewsEntity(
              status: "",
              copyright: "",
              num_results: 0,
              results: [NewsDataModel(id: 0, title: "te", abstract: "queen")])
          ..newsResult = NewsEntity(
              status: "",
              copyright: "",
              num_results: 0,
              results: [NewsDataModel(id: 0, title: "te", abstract: "queen")]),
      ),
    ],
  );
  blocTest<NewsBloc, NewsState>(
    'should emit re assign the result model from api stored model',
    build: () {
      return newsBloc;
    },
    act: (bloc) => bloc.onSearchNewsEvent(""),
    expect: () => [
      NewsState(
        (b) => b
          ..isLoading = false
          ..isSuccess = false
          ..isSearch = false
          ..isChanged = false
          ..errorMessage = ''
          ..newsEntity =
              NewsEntity(status: "", copyright: "", num_results: 0, results: [])
          ..newsResult = NewsEntity(
              status: "", copyright: "", num_results: 0, results: []),
      ),
    ],
  );
  blocTest<NewsBloc, NewsState>(
    'should emit the opposite of isSearch',
    build: () {
      return newsBloc;
    },
    seed: () => NewsState(
      (b) => b
        ..isLoading = false
        ..isSuccess = false
        ..isSearch = false
        ..isChanged = false
        ..errorMessage = ''
        ..newsEntity = NewsEntity(
            status: "",
            copyright: "",
            num_results: 0,
            results: [NewsDataModel(id: 0, title: "te", abstract: "queen")])
        ..newsResult =
            NewsEntity(status: "", copyright: "", num_results: 0, results: []),
    ),
    act: (bloc) => bloc.onChangeIsSearch(),
    expect: () => [
      NewsState(
        (b) => b
          ..isLoading = false
          ..isSuccess = false
          ..isSearch = true
          ..isChanged = false
          ..errorMessage = ''
          ..newsEntity =
              NewsEntity(status: "", copyright: "", num_results: 0, results: [])
          ..newsResult = NewsEntity(
              status: "", copyright: "", num_results: 0, results: []),
      ),
    ],
  );
}
