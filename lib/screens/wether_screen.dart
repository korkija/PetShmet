import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_shmet/widgets/NameWidget.dart';
import 'package:pet_shmet/StreamProviderTest.dart';
import 'package:pet_shmet/widgets/UserNameWidget.dart';
import 'package:pet_shmet/main.dart';

class WetherScreen extends ConsumerStatefulWidget {
  const WetherScreen({super.key});

  @override
  ConsumerState<WetherScreen> createState() => _WetherScreen();
}

class _WetherScreen extends ConsumerState<WetherScreen> {
  String userId = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Wether Page")),
        body: content(context));
  }

  Widget content(BuildContext context) {
    // final user = ref.watch(fetchUserProvider(userId, 1, false));
    final user = ref.watch(
        fetchUserProvider(userId: userId, intValue: 1, boolValue: false));
    // print('<<< XX user $user');
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              // userId = value;
              // print('<<< 00 userID $userId');
              // setState(() {});
              setState(() {
                userId = value;
              });
            },
          ),
          const NameWidget(),
          UserNameWidget(
            userId: userId,
          ),
          const StreamProviderTest(),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/settings');
            },
            child: const Text('Navigate to Settings'),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed('five-days');
            },
            child: const Text('Navigate to 5 days weather'),
          )
        ],
      ),
    );
  }
}
