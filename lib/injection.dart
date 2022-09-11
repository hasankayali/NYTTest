import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nytimestest/features/new_york_times/data/data_source/get_news_remote_data_source.dart';
import 'package:nytimestest/features/new_york_times/domain/usecases/get_news.dart';
import 'package:nytimestest/features/new_york_times/presentation/bloc/news_bloc.dart';

import 'core/constants/api_constant.dart';
import 'core/network/network_info.dart';
import 'features/new_york_times/data/repositories/news_repository_impl.dart';
import 'features/new_york_times/domain/repositories/news_repository.dart';

final sl = GetIt.instance;

///
/// The [init] function is responsible for adding the instances to the graph
///
Future<void> init() async {
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: 12000,
          receiveTimeout: 12000,
          baseUrl: MyUrls.baseUrl,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          responseHeader: true,
          requestHeader: true,
          request: true,
        ),
      );

      return dio;
    },
  );
  sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(dio: sl()),
  );
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()),
  );
  sl.registerLazySingleton(
    () => GetNews(sl()),
  );
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Bloc

  sl.registerLazySingleton(() => NewsBloc(getNews: sl()));
}
