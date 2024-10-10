import 'package:chat_bubbles/src/core/utils/data_state.dart';
import 'package:chat_bubbles/src/data/models/user_model.dart';

abstract class IRemoteRepository {
  Future<DataState<UserModel>> updateUser(Map<String,  dynamic> data);
  Future<DataState<UserModel>> loginUser(Map<String,  dynamic> data);
  Future<DataState<void>> logoutUser();
  Future<DataState<UserModel>> registerUser(Map<String,  dynamic> data);
}
