import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_shmet/screens/types/movie.dart';

class MovieList extends StatefulWidget {
  final List<Movie> movies;

  const MovieList({Key? key, required this.movies}) : super(key: key);

  @override
  MovieListState createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToTop() {
    _scrollController.jumpTo(
      0.0,
      // duration: Duration(milliseconds: 300),
      // curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.movies.length,
      itemBuilder: (context, index) {
        final movie = widget.movies[index];
        return Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).go('/movie/${movie.id}');
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                              width: .5,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                                child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      movie.originalTitle,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(fontSize: 16.0),
                                      maxLines: 3,
                                      overflow: TextOverflow
                                          .ellipsis, // Щоб текст не виходив за межі
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      movie.overview,
                                      style: const TextStyle(fontSize: 12.0),
                                      maxLines: 8,
                                      overflow: TextOverflow
                                          .ellipsis, // Щоб текст не виходив за межі
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 6, 0),
                                  child: Text(
                                    movie.releaseDate,
                                    style: const TextStyle(fontSize: 12.0),
                                    maxLines: 1,
                                    textAlign: TextAlign.end,
                                    overflow: TextOverflow
                                        .ellipsis, // Щоб текст не виходив за межі
                                  ),
                                ),
                              ],
                            ))
                          ],
                        )))));
      },
    );
  }
}
