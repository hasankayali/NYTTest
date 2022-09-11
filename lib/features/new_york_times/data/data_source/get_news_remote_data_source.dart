import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nytimestest/core/constants/exception.dart';
import 'package:nytimestest/features/new_york_times/data/models/news_model.dart';

import '../../../../core/constants/api_constant.dart';

abstract class NewsRemoteDataSource {
  Future<NewsModel> getNews(int period);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<NewsModel> getNews(int period) async {
    try {
      final result = await dio.get("${MyUrls.mostPopular}$period.json",
          queryParameters: {"api-key": Variables.apiKey});

      return NewsModel.fromJson(json.decode(result.data));
    } on DioError catch (ex) {
      if (ex.type == DioErrorType.connectTimeout) {
        throw ConnectionException();
      } else if (ex.type == DioErrorType.receiveTimeout) {
        throw ConnectionException();
      }
      throw ServerException();
    } catch (e) {
      throw ServerException();
    }
  }
}
