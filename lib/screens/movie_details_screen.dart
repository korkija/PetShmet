import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/providers/movie_provider.dart';
import 'package:pet_shmet/screens/types/movieDetails.dart';
import 'package:pet_shmet/widgets/videoByMovieId.dart';

class MovieDetailsScreen extends ConsumerStatefulWidget {
  final String movieId;
  const MovieDetailsScreen({required this.movieId, super.key});

  @override
  ConsumerState<MovieDetailsScreen> createState() => _MovieDetailsScreen();
}

class _MovieDetailsScreen extends ConsumerState<MovieDetailsScreen> {
  String movieName = '';
  bool isTitleSet = false;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<MovieDetails>>(
      movieByIdProvider(widget.movieId),
      (previous, next) {
        print(
          '<< isTitleSet ${isTitleSet}',
        );
        print(
          '<< next ${next}',
        );
        if (next is AsyncData<MovieDetails> && !isTitleSet) {
          setState(() {
            print(
              '<< movie ${next.value.title}',
            );
            movieName = next.value.title; // Оновлення назви
            isTitleSet = true; // Уникаємо повторних оновлень
          });
        }
      },
    );

    final movieById = ref.watch(movieByIdProvider(widget.movieId));

    return Scaffold(
      appBar: AppBar(
        title: Text(movieName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Expanded(
          child: SingleChildScrollView(
            child: movieById.when(
              data: (movie) {
                // print(
                //   '<< movie ${movie.title}',
                // );
                // setState(() {
                //   movieName = movie.title;
                // });

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Container(
                    //   child: Text(
                    //     movie.title,
                    //     textAlign: TextAlign.center,
                    //     style: const TextStyle(fontSize: 20.0),
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                    // const SizedBox(height: 8.0),
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      movie.overview,
                      style: const TextStyle(fontSize: 14.0),
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                      child: Text(
                        movie.releaseDate,
                        style: const TextStyle(fontSize: 12.0),
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    VideoByMovieId(
                      movieId: widget.movieId,
                    )
                  ],
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, _) => Center(child: Text('Error: $err')),
            ),
          ),
        ),
      ),
    );
  }
}
