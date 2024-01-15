import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_api_json_placefolder/view/user_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UserView(),
    );
  }
}

// class PostPage extends StatelessWidget {
//   const PostPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<UserState> userList = [];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('OpenAPIのテスト'),
//       ),
//       // FutureBuilderを使うと非同期処理を簡単に書ける
//       body: FutureBuilder<List<UserState>?>(
//         future: OpenApiClient().getUser(),
//         builder: (context, snapshot) {
//           // 通信中はスピナーを表示
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           // 通信が完了したらデータを表示
//           if (snapshot.hasData) {
//             userList.addAll(snapshot.data!); // DartのListはaddAllで一気に追加できる
//             return ListView.builder(
//               itemCount: userList.length,
//               itemBuilder: (context, index) {
//                 final user = userList[index];
//                 return ListTile(
//                   title: Text('ユーザーID: ${user.id}'),
//                   subtitle: Text('ユーザー名: ${user.name}'),
//                 );
//               },
//             );
//           }
//           // 通信が失敗したらエラーを表示
//           if (snapshot.hasError) {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           }
//           return const Center(
//             child: Text('データがありません'),
//           );
//         },
//       ),
//     );
//   }
// }
