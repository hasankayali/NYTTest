import 'package:json_annotation/json_annotation.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/media_meta_data.dart';

part 'media_meta_data_data_model.g.dart';

@JsonSerializable()
class MediaMetaDataDataModel extends MediaMetaDataEntity {
  final String? url;
  final String? format;
  final int? height;
  final int? width;

  const MediaMetaDataDataModel({
    this.url,
    this.format,
    this.height,
    this.width,
  });
  Map<String, dynamic> toJson() => _$MediaMetaDataDataModelToJson(this);
  factory MediaMetaDataDataModel.fromJson(Map<String, dynamic> json) =>
      _$MediaMetaDataDataModelFromJson(json);
}
