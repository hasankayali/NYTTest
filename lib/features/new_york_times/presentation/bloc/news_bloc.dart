import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimestest/features/new_york_times/domain/usecases/get_news.dart';

import '../../data/models/news_data_model.dart';
import '../../domain/entities/news.dart';
import 'news_events.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {
  final GetNews getNews;

  NewsBloc({required this.getNews}) : super(NewsState.initial()) {
    on<GetNewsEvent>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..errorMessage = ""
        ..isSearch = false
        ..isLoading = true));
      final result = await getNews(Params(event.period));

      return result.fold((l) async {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = false
          ..errorMessage = l.message));
      }, (r) async {
        emit(state.rebuild((b) => b
          ..isLoading = false
          ..isSuccess = true
          ..errorMessage = ''
          ..newsEntity = r
          ..newsResult = r));
      });
    });
    on<SearchNewsEvent>((event, emit) {
      if (event.value.isEmpty) {
        emit(state.rebuild((b) => b
          ..newsResult = state.newsEntity
          ..isChanged = false));
      } else {
        List<NewsDataModel> temp = [];
        for (var ele in state.newsEntity.results!) {
          if (ele.title!.toLowerCase().contains(event.value.toLowerCase()) ||
              ele.abstract!.toLowerCase().contains(event.value.toLowerCase())) {
            print("hello");
            temp.add(ele);
          }
        }
        emit(state.rebuild((b) => b
          ..isChanged = !state.isChanged
          ..newsResult = NewsEntity(
              copyright: state.newsEntity.copyright,
              status: state.newsEntity.status,
              num_results: state.newsEntity.num_results,
              results: temp)));
      }
    });
    on<ChangeIsSearch>((event, emit) {
      emit(state.rebuild((b) => b..isSearch = !state.isSearch));
    });
  }

  void onGetNews(int period) {
    add(GetNewsEvent(period));
  }

  void onSearchNewsEvent(String value) {
    add(SearchNewsEvent(value));
  }

  void onChangeIsSearch() {
    add(ChangeIsSearch());
  }
}
