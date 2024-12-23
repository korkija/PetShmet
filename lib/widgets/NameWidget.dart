import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/main.dart';

class NameWidget extends ConsumerStatefulWidget {
  const NameWidget({super.key});

  @override
  ConsumerState<NameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends ConsumerState<NameWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final name = ref.read(nameNotifierProvider) ?? '';
    // final name = ref.watch(userProvider.select((value) => value.name));

    print('<<<---_NameWidgetState use READ >>-- $name --<<');
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.read(nameNotifierProvider) ?? '';
    return Text(name!);
  }
}
