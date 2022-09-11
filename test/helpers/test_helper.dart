import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:nytimestest/features/new_york_times/data/data_source/get_news_remote_data_source.dart';
import 'package:nytimestest/features/new_york_times/domain/repositories/news_repository.dart';

@GenerateMocks([
  NewsRepository,
  NewsRemoteDataSource,
], customMocks: [
  MockSpec<Dio>(as: #MockDio)
])
void main() {}
