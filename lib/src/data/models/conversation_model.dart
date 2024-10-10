// ignore_for_file: invalid_annotation_target

import 'package:chat_bubbles/src/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    required String conversationId,
    required final UserModel user,
    required final String lastMessage,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) => _$ConversationModelFromJson(json);
}
