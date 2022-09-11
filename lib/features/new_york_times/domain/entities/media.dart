import 'package:equatable/equatable.dart';

import 'media_meta_data.dart';

class MediaEntity extends Equatable {
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;
  final int? approved_for_syndication;
  final List<MediaMetaDataEntity>? metadata;

  const MediaEntity({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.approved_for_syndication,
    this.metadata,
  });

  @override
  List<Object?> get props => [];
}
