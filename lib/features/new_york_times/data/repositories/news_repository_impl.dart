import 'package:dartz/dartz.dart';
import 'package:nytimestest/core/constants/api_constant.dart';
import 'package:nytimestest/core/network/network_info.dart';
import 'package:nytimestest/features/new_york_times/data/data_source/get_news_remote_data_source.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news.dart';

import '../../domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<String, NewsEntity>> getNews(int period) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getNews(period);
        return Right(response);
      } catch (e) {
        return Left(e.toString());
      }
    } else {
      return const Left(Er.networkError);
    }
  }
}
