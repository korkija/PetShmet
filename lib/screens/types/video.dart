import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';
part 'video.g.dart';

@freezed
class VideoDetails with _$VideoDetails {
  const factory VideoDetails({
    @Default('id') String? id,
    @Default('en') @JsonKey(name: 'iso_639_1') String? iso6391,
    @Default('US') @JsonKey(name: 'iso_3166_1') String? iso31661,
    @Default('') String? name,
    @Default('') String? key,
    @Default('') String? site,
    @Default(0) int? size,
    @Default('') String? type,
    @Default(true) bool? official,
    @Default('') @JsonKey(name: 'published_at') String? publishedAt,
    // @Default([]) List<VideoResult> results,
  }) = _VideoDetails;

  factory VideoDetails.fromJson(Map<String, dynamic> json) =>
      _$VideoDetailsFromJson(json);
}
