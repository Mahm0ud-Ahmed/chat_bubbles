import 'dart:async';

import 'package:chat_bubbles/src/core/utils/data_state.dart';
import 'package:chat_bubbles/src/data/models/user_model.dart';
import 'package:chat_bubbles/src/data/remote/firebase_chat.dart';
import 'package:chat_bubbles/src/data/repositories/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/repositories/interfaces/i_chat_remote_repository.dart';
import '../../../../assistant/api_data_state.dart';

class HomeCubit<T> extends Cubit<ApiDataState<T>> {
  late final IChatRemoteRepository _chatRepository;
  HomeCubit() : super(const ApiDataIdle()) {
    _chatRepository = ChatRepositoryImp(chat: FirebaseChat());
  }

  Stream<DataState<List<UserModel>>> getUsers() {
    // emit(const ApiDataLoading());
    return _chatRepository.getAllUsers().asBroadcastStream();

    // _users = response.listen(
    //   (state) {
    //     state.when(
    //       success: (success) => emit(ApiDataSuccessList(response: success.cast<T>())),
    //       failure: (error) => emit(ApiDataError(error: error)),
    //     );
    //   },
    // );
  }

  Future<void> getHistoryChat() async {
    emit(ApiDataLoading());
    final response = await _chatRepository.getHistoryChat();
    response.when(
      success: (data) => emit(ApiDataSuccessList(response: data.cast<T>())),
      failure: (data) => emit(ApiDataError(error: data)),
    );
  }
}
