// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsDataModel _$NewsDataModelFromJson(Map<String, dynamic> json) =>
    NewsDataModel(
      uri: json['uri'] as String?,
      url: json['url'] as String?,
      id: json['id'] as int,
      asset_id: json['asset_id'] as int?,
      source: json['source'] as String?,
      published_date: json['published_date'] as String?,
      updated: json['updated'] as String?,
      section: json['section'] as String?,
      subsection: json['subsection'] as String?,
      nytdsection: json['nytdsection'] as String?,
      adx_keywords: json['adx_keywords'] as String?,
      byline: json['byline'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      abstract: json['abstract'] as String?,
      des_facet: (json['des_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      org_facet: (json['org_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      per_facet: (json['per_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      geo_facet: (json['geo_facet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => MediaDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      eta_id: json['eta_id'] as int?,
    );

Map<String, dynamic> _$NewsDataModelToJson(NewsDataModel instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'url': instance.url,
      'id': instance.id,
      'asset_id': instance.asset_id,
      'source': instance.source,
      'published_date': instance.published_date,
      'updated': instance.updated,
      'section': instance.section,
      'subsection': instance.subsection,
      'nytdsection': instance.nytdsection,
      'adx_keywords': instance.adx_keywords,
      'byline': instance.byline,
      'type': instance.type,
      'title': instance.title,
      'abstract': instance.abstract,
      'des_facet': instance.des_facet,
      'org_facet': instance.org_facet,
      'per_facet': instance.per_facet,
      'geo_facet': instance.geo_facet,
      'media': instance.media,
      'eta_id': instance.eta_id,
    };
