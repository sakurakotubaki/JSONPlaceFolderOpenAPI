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

// class UserState {
//   final int id;
//   final String name;
//   final String username;
//   final String email;

//   UserState({
//     required this.id,
//     required this.name,
//     required this.username,
//     required this.email,
//   });

//   factory UserState.fromJson(Map<String, dynamic> json) {
//     return UserState(
//       id: json['id'],
//       name: json['name'],
//       username: json['username'],
//       email: json['email'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'username': username,
//       'email': email,
//     };
//   }
// }
