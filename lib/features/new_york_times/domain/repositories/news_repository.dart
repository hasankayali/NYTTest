import 'package:dartz/dartz.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news.dart';

abstract class NewsRepository {
  Future<Either<String, NewsEntity>> getNews(int period);
}
