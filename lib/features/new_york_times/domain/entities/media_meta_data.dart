import 'package:equatable/equatable.dart';

class MediaMetaDataEntity extends Equatable {
  final String? url;
  final String? format;
  final int? height;
  final int? width;

  const MediaMetaDataEntity({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  @override
  List<Object?> get props => [];
}
