import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/screens/types/movie.dart';
import 'package:pet_shmet/screens/types/movieDetails.dart';
import 'package:pet_shmet/screens/types/video.dart';
import '../services/api_service.dart';
import 'package:dio/dio.dart';

final dioProvider = Provider((ref) => Dio());

final apiServiceProvider =
    Provider((ref) => ApiService(ref.watch(dioProvider)));

final movieByIdProvider =
    FutureProvider.family<MovieDetails, String>((ref, movieId) async {
  return ref.watch(apiServiceProvider).fetchMovieDetails(movieId);
});
final movieVideoByIdProvider =
    FutureProvider.family<List<VideoDetails>, String>((ref, movieId) async {
  return ref.watch(apiServiceProvider).fetchMovieVideoDetails(movieId);
});

final popularTodayProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.watch(apiServiceProvider).fetchPopularMovies('day');
});

final popularWeekProvider = FutureProvider<List<Movie>>((ref) async {
  return ref.watch(apiServiceProvider).fetchPopularMovies('week');
});
