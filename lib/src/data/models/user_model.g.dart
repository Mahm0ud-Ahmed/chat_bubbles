// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      avatar: json['avatar'] as String,
      email: json['email'] as String,
      userName: json['user_name'] as String,
      fcmToken: json['fcm_token'] as String?,
      isTyping: json['is_typing'] as bool? ?? false,
      lastActive: json['last_active'] as String?,
      onlineStatus: json['online_status'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'avatar': instance.avatar,
      'email': instance.email,
      'user_name': instance.userName,
      'fcm_token': instance.fcmToken,
      'is_typing': instance.isTyping,
      'last_active': instance.lastActive,
      'online_status': instance.onlineStatus,
    };
