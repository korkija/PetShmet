import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_shmet/widgets/InputNameWidget.dart';
import 'package:pet_shmet/widgets/InputUserNameWidget.dart';
import 'package:pet_shmet/main.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(userChangeNotifierProvider, ((previousState, currentState) {
    //   ScaffoldMessenger.of(context).showSnackBar((SnackBar(
    //       content: Text(
    //           'Our email was ${previousState?.user.email} and now email is ${currentState.user.email}'))));
    // }));

    return Scaffold(
        appBar: AppBar(title: Consumer(
          builder: ((context, ref, child) {
            final user = ref.watch(nameNotifierProvider);
            log('<<< user $user');
            // final user = ref.watch(userChangeNotifierProvider).user;
            return Text("Settings Page ${user}");
          }),
          //  child:Text("Settings Page")
        )),
        body: content(context));
  }

  void onPressed(WidgetRef ref) {
    ref.read(isAuthorize.notifier).update((state) => false);
  }

  Widget content(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const InputNameWidget(),
          const InputUserNameWidget(),
          // Text(
          //   '$user',
          //   style: Theme.of(context).textTheme.headlineMedium,
          // ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/');
            },
            child: const Text('Navigate to Home screen'),
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return ElevatedButton(
                onPressed: () {
                  onPressed(ref);
                },
                child: const Text('LogOut'),
              );
            },
          ),
        ],
      ),
    );
  }
}
