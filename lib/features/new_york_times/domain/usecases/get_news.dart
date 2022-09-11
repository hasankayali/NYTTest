import 'package:dartz/dartz.dart';
import 'package:nytimestest/core/usecases/UseCase.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/news.dart';

import '../repositories/news_repository.dart';

class GetNews extends UseCase<NewsEntity, Params> {
  final NewsRepository repository;

  GetNews(this.repository);

  @override
  Future<Either<dynamic, NewsEntity>> call(Params params) async {
    return await repository.getNews(params.period);
  }
}

class Params {
  final int period;

  Params(this.period);
}
