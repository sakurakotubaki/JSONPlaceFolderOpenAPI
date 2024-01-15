# open_api_json_placefolder

1. 自動生成したファイルを入れるディレクトリを作成
```bash
mkdir client
```

2. openapi.yamlをプロジェクト内に作成する
```yaml
openapi: 3.0.0
info:
  title: User API
  version: 1.0.0
servers:
  - url: https://jsonplaceholder.typicode.com
paths:
  /users:
    get:
      summary: Get a list of users
      responses:
        200:
          description: Success
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: '#/components/schemas/User'
  /users/{id}:
    get:
      summary: Get a user by ID
      parameters:
        - in: path
          name: id
          schema:
            type: integer
          required: true
          description: The id of the user to retrieve
      responses:
        200:
          description: Success
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/User'
components:
  schemas:
    User:
      type: object
      properties:
        id:
          type: integer
        name:
          type: string
        username:
          type: string
        email:
          type: string
        address:
          type: object
          properties:
            street:
              type: string
            suite:
              type: string
            city:
              type: string
            zipcode:
              type: string
            geo:
              type: object
              properties:
                lat:
                  type: string
                lng:
                  type: string
        phone:
          type: string
        website:
          type: string
        company:
          type: object
          properties:
            name:
              type: string
            catchPhrase:
              type: string
            bs:
              type: string
```

3. CLIが必要なのでインストールしておく
https://openapi-generator.tech/docs/installation/

自動生成のコマンドを実行する
```bash
openapi-generator generate -i ./openapi.yaml -g dart -o ./client
```

riverpodを追加する:
```bash
flutter pub add \
flutter_riverpod \
riverpod_annotation \
dev:riverpod_generator \
dev:build_runner \
dev:custom_lint \
dev:riverpod_lint
```

Freezedを追加する:
```bash
flutter pub add \
  freezed_annotation \
  --dev build_runner \
  --dev freezed \
  json_annotation \
  --dev json_serializable
```

## モデルクラスをFreezedに変更する
Freezedを使うと、fromJSONとtoJSONを書かなてくよくなる。ゲッターも作ってくれる。

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    required int id,
    required String name,
    required String username,
    required String email,
  }) = _UserState;

  factory UserState.fromJson(Map<String, Object?> json)
      => _$UserStateFromJson(json);
}
```

## APIのコードを修正
Providerでグローバルに呼び出せるようにする。
```dart
import 'package:flutter/material.dart';
import 'package:open_api_json_placefolder/model/user.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'api_client.g.dart';

@Riverpod(keepAlive: true)
OpenApiClient openApiClient(OpenApiClientRef ref) => OpenApiClient();

// OpenAPIで自動生成されたコードを呼び出して使う
class OpenApiClient {
  final ApiClient apiClient = ApiClient(
    basePath: 'https://jsonplaceholder.typicode.com',
  );

  Future<List<UserState>> getUser() async {
    try {
      final DefaultApi defaultApi = DefaultApi(apiClient);
      final response = await defaultApi.usersGet();
      final List<UserState> users = [];
      if (response != null) {
        debugPrint('APIのレスポンス${response}');
        debugPrint('APIのlength${response.length}');
        for (final r in response) {
          // users.add(UserState.fromJson(r.toJson()));
          users.add(UserState.fromJson(r.toJson()));
        }
      }
      return users;
    } on Exception catch (e) {
      throw Exception('Failed to load post$e');
    }
  }
}
```

## Viewのコードをwhenに変更
FutureBuilderから、AsyncValueで取得したデータを表示する時に、簡潔に書ける`when`に変更する。

```dart
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
```

## main.dartを修正してビルドする
`ProviderScope`でmain関数をラップする。

```dart
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
```
