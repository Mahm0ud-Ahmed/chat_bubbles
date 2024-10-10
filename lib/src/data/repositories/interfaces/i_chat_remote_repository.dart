import 'package:chat_bubbles/src/core/utils/data_state.dart';
import 'package:chat_bubbles/src/data/models/user_model.dart';

import '../../models/conversation_model.dart';
import '../../models/message_model.dart';

abstract class IChatRemoteRepository {
  Stream<DataState<List<UserModel>>> getAllUsers();
  Stream<DataState<List<MessageModel>>> getChat(String chatId);
  Future<DataState<List<ConversationModel>>> getHistoryChat();
  Future<DataState<String>> getChatId(String otherUserId);
  Future<DataState<void>> sendChat(String otherUserId, String message);
  Stream<DataState<UserModel>> getOtherUser(String id);
}
