import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/providers/movie_provider.dart';
import 'package:pet_shmet/widgets/youtubePlayer.dart';

class VideoByMovieId extends ConsumerWidget {
  final String movieId;
  const VideoByMovieId({required this.movieId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieVideoById = ref.watch(movieVideoByIdProvider(movieId));

    return movieVideoById.when(
      data: (videoArray) {
        List<Widget> widgets = [];
        for (var item in videoArray) {
          widgets.add(Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 7.0),
              child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: .5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8.0),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            item.name ?? 'NULL',
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 16.0),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (item.site?.toLowerCase() == 'youtube')
                            Container(
                              height: 250,
                              color: Colors.amber,
                              child: VideoPlayerScreen(
                                videoUrl:
                                    'https://www.youtube.com/watch?v=${item.key}', // URL YouTube відео
                              ),
                            ),
                        ],
                      )),
                    ],
                  ))));
        }
        return Column(children: widgets);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text('Error: $err')),
      // ),
    );
  }
}
