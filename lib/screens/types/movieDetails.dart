import 'package:freezed_annotation/freezed_annotation.dart';

part 'movieDetails.freezed.dart';
part 'movieDetails.g.dart';

@freezed
class MovieDetails with _$MovieDetails {
  const factory MovieDetails({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'poster_path') required String posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    required double popularity,
    required List<Genre> genres,
    @JsonKey(name: 'vote_average') required double voteAverage,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    required int id,
    required String name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
