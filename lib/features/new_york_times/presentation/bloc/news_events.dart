import 'package:flutter/foundation.dart';

@immutable
abstract class NewsEvents {}

class GetNewsEvent extends NewsEvents {
  final int period;
  GetNewsEvent(this.period);
}

class SearchNewsEvent extends NewsEvents {
  final String value;
  SearchNewsEvent(this.value);
}

class ChangeIsSearch extends NewsEvents {
  ChangeIsSearch();
}
