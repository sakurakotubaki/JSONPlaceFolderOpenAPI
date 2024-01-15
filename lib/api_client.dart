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
