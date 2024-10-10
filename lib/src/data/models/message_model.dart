// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required final String senderUid,
    required final String message,
    // Convert Timestamp to DateTime
    @JsonKey(fromJson: _timestampToDateTime, toJson: _dateTimeToTimestamp)
    final DateTime? timestamp,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}

// Conversion functions

// Convert Firestore Timestamp to DateTime
DateTime? _timestampToDateTime(Timestamp? timestamp) {
  return timestamp?.toDate();
}

// Convert DateTime to Firestore Timestamp
Timestamp? _dateTimeToTimestamp(DateTime? dateTime) {
  if (dateTime == null) return null;
  return Timestamp.fromDate(dateTime);
}