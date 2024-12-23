import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/main.dart';

class StreamProviderTest extends ConsumerWidget {
  const StreamProviderTest({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamNumber = ref.watch(streamProvider);
    return streamNumber.when(
        data: (data) {
          return Center(
              child: Text(data.toString(), style: TextStyle(fontSize: 25)));
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
