import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/main.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final name = ref.read(userChangeNotifierProvider).user.name;
    return Scaffold(
        appBar: AppBar(title: Text("LOGIN Page NAME")), body: content(context));
  }

  void onPressed(WidgetRef ref) {
    ref.read(isAuthorize.notifier).update((state) => true);
  }

  Widget content(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ElevatedButton(
                onPressed: () {
                  onPressed(ref);
                },
                child: const Text('Login'),
              );
            },
          ),
        ],
      ),
    );
  }
}
