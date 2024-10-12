import 'dart:async';

import 'package:chat_bubbles/src/data/models/user_model.dart';
import 'package:chat_bubbles/src/data/remote/firebase_chat.dart';
import 'package:chat_bubbles/src/data/repositories/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/data_state.dart';
import '../../../../../data/models/message_model.dart';
import '../../../../../data/repositories/interfaces/i_chat_remote_repository.dart';
import '../../../../assistant/api_data_state.dart';

class ChatUserCubit<T> extends Cubit<ApiDataState<T>> {
  late final IChatRemoteRepository _chatRepository;
  ChatUserCubit() : super(const ApiDataIdle()) {
    _chatRepository = ChatRepositoryImp(chat: FirebaseChat());
  }

  Future<void> getChatId(String otherUserId) async {
    emit(ApiDataLoading());

    final state = await _chatRepository.getChatId(otherUserId);
    state.when(
      success: (data) => emit(ApiDataSuccessModel(response: data as T)),
      failure: (data) => emit(ApiDataError(error: data)),
    );
  }

  Stream<DataState<List<MessageModel>>> getChat(String chatId) {
    return _chatRepository.getChat(chatId);
  }

  Stream<DataState<UserModel>> getOtherUser(String userId) {
    return _chatRepository.getOtherUser(userId);
  }

  Future<void> sendMessage(String otherUserId, String message) async{
    await _chatRepository.sendChat(otherUserId, message);
  }
}
