import 'package:equatable/equatable.dart';
import 'package:nytimestest/features/new_york_times/data/models/media_data_model.dart';

class NewsDataEntity extends Equatable {
  final String? uri;
  final String? url;
  final int id;
  final int? asset_id;
  final String? source;
  final String? published_date;
  final String? updated;
  final String? section;
  final String? subsection;
  final String? nytdsection;
  final String? adx_keywords;
  final String? byline;
  final String? type;
  final String? title;
  final String? abstract;
  final List<String>? des_facet;
  final List<String>? org_facet;
  final List<String>? per_facet;
  final List<String>? geo_facet;
  final List<MediaDataModel>? media;
  final int? eta_id;
  const NewsDataEntity({
    this.uri,
    this.url,
    required this.id,
    this.asset_id,
    this.source,
    this.published_date,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adx_keywords,
    this.byline,
    this.type,
    this.title,
    this.abstract,
    this.des_facet,
    this.org_facet,
    this.per_facet,
    this.geo_facet,
    this.media,
    this.eta_id,
  });

  @override
  List<Object?> get props => [];
}
