import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nytimestest/features/new_york_times/data/models/news_model.dart';
import 'package:nytimestest/features/new_york_times/domain/usecases/get_news.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockNewsRepository mockNewsRepository;
  late GetNews useCase;

  setUp(() {
    mockNewsRepository = MockNewsRepository();
    useCase = GetNews(mockNewsRepository);
  });

  NewsModel testNewsDetail = NewsModel(
      num_results: 10, copyright: "test", status: "true", results: []);

  const tCityName = 7;

  test(
    'should get current news detail from the repository',
    () async {
      // arrange
      when(mockNewsRepository.getNews(tCityName))
          .thenAnswer((_) async => Right(testNewsDetail));

      // act
      final result = await useCase.call(Params(tCityName));

      // assert
      expect(result, equals(Right(testNewsDetail)));
    },
  );
}
