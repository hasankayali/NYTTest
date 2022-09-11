import 'package:dartz/dartz.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news.dart';

import '../../../../core/constants/failure.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsEntity>> getNews(int period);
}
