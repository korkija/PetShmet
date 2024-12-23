import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_shmet/main.dart';

class WetherFiveDayScreen extends ConsumerWidget {
  const WetherFiveDayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(userProvider, ((previousState, currentState) {
    //   ScaffoldMessenger.of(context).showSnackBar((SnackBar(
    //       content: Text(
    //           'Our email was ${previousState?.email} and now email is ${currentState.email}'))));
    // }));
    return Scaffold(
        appBar: AppBar(title: const Text("Wether Five Days Page")),
        body: content(context));
  }

  Widget content(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/wether');
            },
            child: const Text('Navigate to Weather'),
          )
        ],
      ),
    );
  }
}
