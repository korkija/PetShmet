import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/main.dart';

class InputNameWidget extends ConsumerStatefulWidget {
  const InputNameWidget({super.key});

  @override
  ConsumerState<InputNameWidget> createState() => _InputNameWidgetState();
}

class _InputNameWidgetState extends ConsumerState<InputNameWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final name = ref.read(nameNotifierProvider) ?? '';

    // print('<<<---_InputNameWidgetState use READ $name');
  }

  void onSubmit(WidgetRef ref, String value) {
    ref.read(nameNotifierProvider.notifier).updateName(value.toUpperCase());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(onSubmitted: (value) => onSubmit(ref, value)));
  }
}
