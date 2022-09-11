import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nytimestest/core/constants/api_constant.dart';
import 'package:nytimestest/core/constants/failure.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news.dart';
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

  const tNews = NewsEntity(
      num_results: 10, copyright: "test", status: "true", results: []);

  blocTest<NewsBloc, NewsState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetCurrentNews.call(any))
          .thenAnswer((_) async => const Right(tNews));
      return newsBloc;
    },
    act: (bloc) => bloc.add(GetNewsEvent(7)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      NewsState(
        (b) => b
          ..isLoading = true
          ..isSuccess = false
          ..errorMessage = ''
          ..newsEntity = const NewsEntity(
              status: "", copyright: "", num_results: 0, results: []),
      ),
      newsBloc.state
    ],
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
    expect: () => [
      NewsState(
        (b) => b
          ..isLoading = true
          ..isSuccess = false
          ..errorMessage = ''
          ..newsEntity = const NewsEntity(
              status: "", copyright: "", num_results: 0, results: []),
      ),
      NewsState(
        (b) => b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = Er.error
          ..newsEntity = const NewsEntity(
              status: "", copyright: "", num_results: 0, results: []),
      ),
    ],
    verify: (bloc) {
      verifyNever(mockGetCurrentNews.call(Params(7)));
    },
  );
}
