// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationModelImpl _$$ConversationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationModelImpl(
      conversationId: json['conversation_id'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      lastMessage: json['last_message'] as String,
    );

Map<String, dynamic> _$$ConversationModelImplToJson(
        _$ConversationModelImpl instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'user': instance.user.toJson(),
      'last_message': instance.lastMessage,
    };
