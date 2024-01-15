import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_api_json_placefolder/model/user.dart';
import 'package:open_api_json_placefolder/user_view_model.dart';

class UserView extends ConsumerWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<UserState> userList = [];
    final AsyncValue<List<UserState>> users = ref.watch(userViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('RFO'),
      ),
      body: users.when(
        data: (data) {
          userList.addAll(data);
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              final user = userList[index];
              return ListTile(
                title: Text('ユーザーID: ${user.id}'),
                subtitle: Text('ユーザー名: ${user.name}'),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('エラーが発生しました。$error'),
        ),
      ),
    );
  }
}
