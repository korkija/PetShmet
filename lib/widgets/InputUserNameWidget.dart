import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/main.dart';

class InputUserNameWidget extends ConsumerStatefulWidget {
  const InputUserNameWidget({super.key});

  @override
  ConsumerState<InputUserNameWidget> createState() => _InputNameWidgetState();
}

class _InputNameWidgetState extends ConsumerState<InputUserNameWidget> {
  @override
  void initState() {
    super.initState();
  }

  void onSubmit(WidgetRef ref, String value) {
    // ref.read(userChangeNotifierProvider).updateName(value.toLowerCase());
    // ref
    //     .read(userChangeNotifierProvider)
    //     .updateEmail('${value.toLowerCase()}@gmail.com');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(onSubmitted: (value) => onSubmit(ref, value)));
  }
}
