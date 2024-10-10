// ignore_for_file: invalid_annotation_target

import 'package:chat_bubbles/src/data/models/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required final List<String> users,
    required final String lastMessage,
    final List<MessageModel>? messages,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
}
