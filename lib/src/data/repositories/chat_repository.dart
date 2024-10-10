// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chat_bubbles/src/core/error/app_exception.dart';
import 'package:chat_bubbles/src/core/utils/data_state.dart';
import 'package:chat_bubbles/src/data/models/message_model.dart';
import 'package:chat_bubbles/src/data/remote/firebase_chat.dart';

import '../../core/utils/app_logger.dart';
import '../models/conversation_model.dart';
import '../models/user_model.dart';
import 'interfaces/i_chat_remote_repository.dart';

class ChatRepositoryImp extends IChatRemoteRepository {
  final FirebaseChat chat;
  ChatRepositoryImp({required this.chat});

  @override
  Stream<DataState<List<UserModel>>> getAllUsers() async* {
    try {
      final allUsers = chat.getAllUsersAsStream();

      List<UserModel> users = [];
      // parsing to User Model
      await for (final event in allUsers) {
        users = event.map((element) => UserModel.fromJson(element)).toList();
        AppLogger.logDebug(event);
        yield DataState<List<UserModel>>.success(users);
      }
    } catch (e) {
      yield DataState<List<UserModel>>.failure(AppException(e).handleError);
    }
  }

  @override
  Stream<DataState<List<MessageModel>>> getChat(String chatId) async* {
    try {
      final allMessages = chat.getMessagesStream(chatId);

      List<MessageModel> messages = [];
      // parsing to User Model
      await for (final event in allMessages) {
        messages = event.map((element) => MessageModel.fromJson(element)).toList();
        AppLogger.logDebug(event);
        yield DataState<List<MessageModel>>.success(messages);
      }
    } catch (e) {
      yield DataState<List<MessageModel>>.failure(AppException(e).handleError);
    }
  }

  @override
  Future<DataState<String>> getChatId(String otherUserId) async {
    try {
      final data = await chat.getOrCreateConversation(otherUserId);
      return DataState<String>.success(data);
    } catch (e) {
      return DataState<String>.failure(AppException(e).handleError);
    }
  }

  @override
  Future<DataState<void>> sendChat(String otherUserId, String message) async {
    try {
      await chat.sendMessage(otherUserId, message);
      return DataState<void>.success(null);
    } catch (e) {
      return DataState<void>.failure(AppException(e).handleError);
    }
  }

  @override
  Stream<DataState<UserModel>> getOtherUser(String id) async* {
    try {
      final user = chat.getOtherUser(id);

      late UserModel otherUser;
      // parsing to User Model
      await for (final event in user) {
        otherUser = UserModel.fromJson(event);
        AppLogger.logDebug(event);
        yield DataState<UserModel>.success(otherUser);
      }
    } catch (e) {
      yield DataState<UserModel>.failure(AppException(e).handleError);
    }
  }

  @override
  Future<DataState<List<ConversationModel>>> getHistoryChat() async {
    try {
      final allConversation = await chat.getConversationLogs();

      List<ConversationModel> conversations = allConversation.map((element) => ConversationModel.fromJson(element)).toList();
      return DataState<List<ConversationModel>>.success(conversations);
    } catch (e) {
      return DataState<List<ConversationModel>>.failure(AppException(e).handleError);
    }
  }
}
