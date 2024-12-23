import 'package:dio/dio.dart';
import 'package:pet_shmet/screens/types/movie.dart';
import 'package:pet_shmet/network/endpoints.dart';
import 'package:pet_shmet/screens/types/movieDetails.dart';
import 'package:pet_shmet/screens/types/video.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<List<Movie>> fetchPopularMovies(String period) async {
    try {
      final response = await _dio.get(
        '${Endpoints.url}/trending/movie/$period',
        queryParameters: {
          'api_key': Endpoints.api_key,
          'Authorization': Endpoints.api_token
        },
      );

      final results = response.data['results'] as List;
      return results.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      throw Exception('Failed to load movies: $e');
    }
  }

  Future<MovieDetails> fetchMovieDetails(String movieId) async {
    try {
      final response = await _dio.get(
        '${Endpoints.url}/movie/$movieId',
        queryParameters: {
          'api_key': Endpoints.api_key,
        },
      );

      return MovieDetails.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }

  Future<List<VideoDetails>> fetchMovieVideoDetails(String movieId) async {
    try {
      final response = await _dio.get(
        '${Endpoints.url}/movie/$movieId/videos?language=en-US',
        queryParameters: {
          'api_key': Endpoints.api_key,
          'Authorization': Endpoints.api_token
        },
      );
      final results = response.data['results'] as List;
      return results.map((movie) {
        return VideoDetails.fromJson(movie);
      }).toList();
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }
}
