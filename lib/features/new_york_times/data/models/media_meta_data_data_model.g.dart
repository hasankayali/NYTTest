// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_meta_data_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaMetaDataDataModel _$MediaMetaDataDataModelFromJson(
        Map<String, dynamic> json) =>
    MediaMetaDataDataModel(
      url: json['url'] as String?,
      format: json['format'] as String?,
      height: json['height'] as int?,
      width: json['width'] as int?,
    );

Map<String, dynamic> _$MediaMetaDataDataModelToJson(
        MediaMetaDataDataModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': instance.format,
      'height': instance.height,
      'width': instance.width,
    };
