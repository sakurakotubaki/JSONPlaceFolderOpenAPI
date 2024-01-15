import 'package:open_api_json_placefolder/api_client.dart';
import 'package:open_api_json_placefolder/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_view_model.g.dart';

@riverpod
class UserViewModel extends _$UserViewModel {
  @override
  FutureOr<List<UserState>> build() {
    return fetchPost();
  }

  Future<List<UserState>> fetchPost() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await ref.read(openApiClientProvider).getUser();
    });

    return state.maybeWhen(
      data: (data) => data,
      orElse: () => throw Exception('API Error👻'),
      );
  }
}
