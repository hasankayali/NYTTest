import 'package:json_annotation/json_annotation.dart';
import 'package:nytimestest/features/new_york_times/domain/entities/media.dart';

import 'media_meta_data_data_model.dart';

part 'media_data_model.g.dart';

@JsonSerializable()
class MediaDataModel extends MediaEntity {
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;
  final int? approved_for_syndication;
  @JsonKey(name: 'media-metadata')
  final List<MediaMetaDataDataModel>? metadata;

  const MediaDataModel({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approved_for_syndication,
    this.metadata,
  });
  Map<String, dynamic> toJson() => _$MediaDataModelToJson(this);
  factory MediaDataModel.fromJson(Map<String, dynamic> json) =>
      _$MediaDataModelFromJson(json);
}
