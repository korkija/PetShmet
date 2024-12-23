import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  // @JsonSerializable(explicitToJson: true)

  const factory Movie({
    // @Default(999) required int id,
    required int id,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    required double popularity,
  }) = _Movie;
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
