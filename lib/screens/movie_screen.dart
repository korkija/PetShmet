import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/screens/types/movie.dart';
import 'package:pet_shmet/providers/movie_provider.dart';
import 'package:pet_shmet/widgets/movieList.dart';
import 'package:pet_shmet/widgets/toggleSwitch.dart';

class MoviePage extends ConsumerStatefulWidget {
  const MoviePage({super.key});

  @override
  ConsumerState<MoviePage> createState() => _MoviePage();
}

class _MoviePage extends ConsumerState<MoviePage> {
  final GlobalKey<MovieListState> _movieListKey = GlobalKey<MovieListState>();
  bool isDay = true;

  void onToggle(bool isDaily) {
    setState(() {
      isDay = isDaily;
    });
    _movieListKey.currentState?.scrollToTop();
  }

  @override
  Widget build(BuildContext context) {
    final todayMovies = ref.watch(popularTodayProvider);
    final weekMovies = ref.watch(popularWeekProvider);
    var data = isDay ? todayMovies : weekMovies;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Movie SCREEN'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Горизонтальний паддінг
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListToggleSwitch(
                onToggle: onToggle,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Popular ${isDay ? 'Today' : 'This Week'}',
                    style: const TextStyle(fontSize: 20)),
              ),
              Expanded(
                child: data.when(
                  data: (movies) =>
                      MovieList(key: _movieListKey, movies: movies),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, _) => Center(child: Text('Error: $err')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
