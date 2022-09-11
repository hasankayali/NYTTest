// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewsState extends NewsState {
  @override
  final bool isLoading;
  @override
  final bool isSuccess;
  @override
  final bool isSearch;
  @override
  final bool isChanged;
  @override
  final String errorMessage;
  @override
  final NewsEntity newsEntity;
  @override
  final NewsEntity newsResult;

  factory _$NewsState([void Function(NewsStateBuilder)? updates]) =>
      (new NewsStateBuilder()..update(updates))._build();

  _$NewsState._(
      {required this.isLoading,
      required this.isSuccess,
      required this.isSearch,
      required this.isChanged,
      required this.errorMessage,
      required this.newsEntity,
      required this.newsResult})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(isLoading, r'NewsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(isSuccess, r'NewsState', 'isSuccess');
    BuiltValueNullFieldError.checkNotNull(isSearch, r'NewsState', 'isSearch');
    BuiltValueNullFieldError.checkNotNull(isChanged, r'NewsState', 'isChanged');
    BuiltValueNullFieldError.checkNotNull(
        errorMessage, r'NewsState', 'errorMessage');
    BuiltValueNullFieldError.checkNotNull(
        newsEntity, r'NewsState', 'newsEntity');
    BuiltValueNullFieldError.checkNotNull(
        newsResult, r'NewsState', 'newsResult');
  }

  @override
  NewsState rebuild(void Function(NewsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsStateBuilder toBuilder() => new NewsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsState &&
        isLoading == other.isLoading &&
        isSuccess == other.isSuccess &&
        isSearch == other.isSearch &&
        isChanged == other.isChanged &&
        errorMessage == other.errorMessage &&
        newsEntity == other.newsEntity &&
        newsResult == other.newsResult;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, isLoading.hashCode), isSuccess.hashCode),
                        isSearch.hashCode),
                    isChanged.hashCode),
                errorMessage.hashCode),
            newsEntity.hashCode),
        newsResult.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsState')
          ..add('isLoading', isLoading)
          ..add('isSuccess', isSuccess)
          ..add('isSearch', isSearch)
          ..add('isChanged', isChanged)
          ..add('errorMessage', errorMessage)
          ..add('newsEntity', newsEntity)
          ..add('newsResult', newsResult))
        .toString();
  }
}

class NewsStateBuilder implements Builder<NewsState, NewsStateBuilder> {
  _$NewsState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  bool? _isSearch;
  bool? get isSearch => _$this._isSearch;
  set isSearch(bool? isSearch) => _$this._isSearch = isSearch;

  bool? _isChanged;
  bool? get isChanged => _$this._isChanged;
  set isChanged(bool? isChanged) => _$this._isChanged = isChanged;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  NewsEntity? _newsEntity;
  NewsEntity? get newsEntity => _$this._newsEntity;
  set newsEntity(NewsEntity? newsEntity) => _$this._newsEntity = newsEntity;

  NewsEntity? _newsResult;
  NewsEntity? get newsResult => _$this._newsResult;
  set newsResult(NewsEntity? newsResult) => _$this._newsResult = newsResult;

  NewsStateBuilder();

  NewsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _isSuccess = $v.isSuccess;
      _isSearch = $v.isSearch;
      _isChanged = $v.isChanged;
      _errorMessage = $v.errorMessage;
      _newsEntity = $v.newsEntity;
      _newsResult = $v.newsResult;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsState;
  }

  @override
  void update(void Function(NewsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsState build() => _build();

  _$NewsState _build() {
    final _$result = _$v ??
        new _$NewsState._(
            isLoading: BuiltValueNullFieldError.checkNotNull(
                isLoading, r'NewsState', 'isLoading'),
            isSuccess: BuiltValueNullFieldError.checkNotNull(
                isSuccess, r'NewsState', 'isSuccess'),
            isSearch: BuiltValueNullFieldError.checkNotNull(
                isSearch, r'NewsState', 'isSearch'),
            isChanged: BuiltValueNullFieldError.checkNotNull(
                isChanged, r'NewsState', 'isChanged'),
            errorMessage: BuiltValueNullFieldError.checkNotNull(
                errorMessage, r'NewsState', 'errorMessage'),
            newsEntity: BuiltValueNullFieldError.checkNotNull(
                newsEntity, r'NewsState', 'newsEntity'),
            newsResult: BuiltValueNullFieldError.checkNotNull(
                newsResult, r'NewsState', 'newsResult'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
