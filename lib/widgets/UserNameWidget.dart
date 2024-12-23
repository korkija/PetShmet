import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_shmet/main.dart';

class UserNameWidget extends ConsumerStatefulWidget {
  final String userId;
  const UserNameWidget({super.key, required this.userId});

  @override
  ConsumerState<UserNameWidget> createState() => _NameWidgetState();
}

class _NameWidgetState extends ConsumerState<UserNameWidget> {
  @override
  Widget build(BuildContext context) {
    // print('<<< 11 userID ${widget.userId}');
    final user = ref.watch(
        fetchUserProvider(userId: widget.userId, intValue: 3, boolValue: true));
    // print('<<<--- UserNameWidget user $user');

    return user.when(data: (data) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.name.isNotEmpty) Text('First name: ${data.name}'),
          if (data.email.isNotEmpty) Text('Email: ${data.email}'),
        ],
      );
    }, error: (error, stackTrace) {
      return Text(error.toString());
    }, loading: () {
      return const CircularProgressIndicator();
    });
  }
}
