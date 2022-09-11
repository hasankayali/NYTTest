// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      num_results: json['num_results'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => NewsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'num_results': instance.num_results,
      'results': instance.results,
    };
