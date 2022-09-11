import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nytimestest/core/constants/api_constant.dart';
import 'package:nytimestest/core/network/network_info.dart';
import 'package:nytimestest/features/new_york_times/data/models/news_model.dart';
import 'package:nytimestest/features/new_york_times/data/repositories/news_repository_impl.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockNewsRemoteDataSource mockRemoteDataSource;
  late NewsRepositoryImpl repository;
  late NetworkInfoImpl networkInfo;
  setUp(() {
    networkInfo = NetworkInfoImpl(DataConnectionChecker());
    mockRemoteDataSource = MockNewsRemoteDataSource();
    repository = NewsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: networkInfo,
    );
  });

  const tNewsModel = NewsModel(
      num_results: 10, copyright: "test", status: "true", results: []);

  group('get current News', () {
    final tCityName = 'Jakarta';

    test(
      'should return current News when a call to data source is successful',
      () async {
        // arrange
        when(mockRemoteDataSource.getNews(7))
            .thenAnswer((_) async => tNewsModel);

        // act
        final result = await repository.getNews(7);

        // assert
        verify(mockRemoteDataSource.getNews(7));
        expect(result, equals(Right(tNewsModel)));
      },
    );

    test(
      'should return server failure when a call to data source is unsuccessful',
      () async {
        // arrange
        when(mockRemoteDataSource.getNews(7)).thenThrow(Er.error);

        // act
        final result = await repository.getNews(7);

        // assert
        verify(mockRemoteDataSource.getNews(7));
        expect(result, equals(Left(Er.error)));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockRemoteDataSource.getNews(7)).thenThrow(Er.networkError);

        // act
        final result = await repository.getNews(7);

        // assert
        verify(mockRemoteDataSource.getNews(7));
        expect(
          result,
          equals(Left(Er.networkError)),
        );
      },
    );
  });
}
