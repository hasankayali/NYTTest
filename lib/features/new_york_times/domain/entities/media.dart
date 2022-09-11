import 'package:equatable/equatable.dart';
import 'package:nytimestest/features/new_york_times/data/models/media_meta_data_data_model.dart';

class MediaEntity extends Equatable {
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;
  final int? approved_for_syndication;
  final List<MediaMetaDataDataModel>? metadata;

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
