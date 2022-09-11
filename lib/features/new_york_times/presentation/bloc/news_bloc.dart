import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimestest/features/new_york_times/domain/usecases/get_news.dart';

import 'news_events.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  final GetNews getNews;

  NewsBloc({required this.getNews}) : super(NewsState.initial()) {
    on<GetNewsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..errorMessage = ""
        ..isLoading = true));
      final result = await getNews(Params(event.period));

      return result.fold((l) async {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l));
      }, (r) async {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
          ..newsEntity = r));
      });
    });
  }

  void onGetNews(int period) {
    add(GetNewsEvent(period));
  }
}
