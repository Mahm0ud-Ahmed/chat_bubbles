// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required final String uid,
    required final String avatar,
    required final String email,
    required final String userName,
    final String? fcmToken,
    @Default(false)
    final bool? isTyping,
    required final String? lastActive,
    @Default(true)
    final bool? onlineStatus,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
