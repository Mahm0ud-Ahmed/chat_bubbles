// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      senderUid: json['sender_uid'] as String,
      message: json['message'] as String,
      timestamp: _timestampToDateTime(json['timestamp'] as Timestamp?),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'sender_uid': instance.senderUid,
      'message': instance.message,
      'timestamp': _dateTimeToTimestamp(instance.timestamp),
    };
