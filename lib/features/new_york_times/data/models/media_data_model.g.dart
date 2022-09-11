// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaDataModel _$MediaDataModelFromJson(Map<String, dynamic> json) =>
    MediaDataModel(
      type: json['type'] as String?,
      subtype: json['subtype'] as String?,
      caption: json['caption'] as String?,
      copyright: json['copyright'] as String?,
      approved_for_syndication: json['approved_for_syndication'] as int?,
      metadata: (json['media-metadata'] as List<dynamic>?)
          ?.map(
              (e) => MediaMetaDataDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaDataModelToJson(MediaDataModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'subtype': instance.subtype,
      'caption': instance.caption,
      'copyright': instance.copyright,
      'approved_for_syndication': instance.approved_for_syndication,
      'media-metadata': instance.metadata,
    };
