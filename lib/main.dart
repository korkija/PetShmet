import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pet_shmet/logger_riverpod.dart';
import 'package:pet_shmet/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/screens/splash_screen.dart';
import 'package:pet_shmet/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

// final nameProvider = Provider<String>((ref) {
//   return 'Andrii';
// });
// final nameProvider = StateProvider<String?>((ref) {
//   return null;
//   // return 'Andrii';
// });

@riverpod
class NameNotifier extends _$NameNotifier {
  @override
  String? build() {
    return null; // Початкове значення
  }

  void updateName(String newName) {
    log('<<< newName $newName');
    state = newName;
  }
}

@riverpod
Future<User> fetchUser(FetchUserRef ref,
    {required String userId, required int intValue, required bool boolValue}) {
  log('Init: fetchUser($userId)');
  ref.onCancel(() => log('Cancel: fetchUser($userId)'));
  ref.onResume(() => log('Resume: fetchUser($userId)'));
  ref.onDispose(() => log('Dispose: fetchUser($userId)'));
  final link = ref.keepAlive();
  Timer? timer;

  ref.onResume(() => timer?.cancel());
  ref.onDispose(() => timer?.cancel());
  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 10), () => link.close());
  });
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData(userId);
}

final isAuthorize = StateProvider<bool>((ref) {
  return false;
});
// final userProvider =
//     StateNotifierProvider<UserNotifier, User>(((ref) => UserNotifier()));
// final userChangeNotifierProvider =
//     ChangeNotifierProvider(((ref) => UserNotifierChange()));

// final fetchUserProvider =
//     FutureProvider.autoDispose.family((ref, String userId) {
//   log('Init: fetchUser($userId)');
//   ref.onCancel(() => log('Cancel: fetchUser($userId)'));
//   ref.onResume(() => log('Resume: fetchUser($userId)'));
//   ref.onDispose(() => log('Dispose: fetchUser($userId)'));
//   final link = ref.keepAlive();
//   Timer? timer;

//   ref.onResume(() => timer?.cancel());
//   ref.onDispose(() => timer?.cancel());
//   ref.onCancel(() {
//     timer = Timer(const Duration(seconds: 10), () => link.close());
//   });
//   final userRepository = ref.watch(userRepositoryProvider);
//   return userRepository.fetchUserData(userId);
// }, name: 'Future Provider');

@riverpod
Stream stream(StreamRef ref) {
  return Stream.periodic(
      const Duration(seconds: 1), ((computationCount) => computationCount));
}

// final streamProvider = StreamProvider((ref) {
//   return Stream.periodic(
//       const Duration(seconds: 1), ((computationCount) => computationCount));
// });

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> _initializeApp() async {
    // Симуляція завантаження, наприклад, ініціалізації сервісів
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Показуємо сплеш-скрін, поки додаток ініціалізується
          return MaterialApp(home: const SplashScreen());
        }

        // Після ініціалізації запускаємо основний застосунок
        return const MyMainApp();
      },
    );
  }
}

void main() {
  runApp(ProviderScope(observers: [LoggerRiverpod()], child: const MyApp()));
}

class MyMainApp extends ConsumerWidget {
  const MyMainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider as ProviderListenable);
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
