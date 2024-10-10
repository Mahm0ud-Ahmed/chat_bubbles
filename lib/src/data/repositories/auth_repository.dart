// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chat_bubbles/src/core/error/app_exception.dart';
import 'package:chat_bubbles/src/core/utils/data_state.dart';

import '../models/user_model.dart';
import '../remote/firebase_authentication.dart';
import 'interfaces/i_remote_repository.dart';

class AuthRepositoryImp extends IRemoteRepository {
  final FirebaseAuthentication auth;
  AuthRepositoryImp({required this.auth});

  @override
  Future<DataState<UserModel>> updateUser(Map<String, dynamic> data) async {
    try {
      final user = auth.updateUser(data);

      return DataState<UserModel>.success(UserModel.fromJson(user as Map<String, dynamic>));
    } catch (e) {
      return DataState<UserModel>.failure(AppException(e).handleError);
    }
  }

  @override
  Future<DataState<UserModel>> loginUser(Map<String, dynamic> data) async {
    try {
      final user = await auth.signInWithEmailAndPassword(data);

      return DataState<UserModel>.success(UserModel.fromJson(user as Map<String, dynamic>));
    } catch (e) {
      return DataState<UserModel>.failure(AppException(e).handleError);
    }
  }

  @override
  Future<DataState<UserModel>> registerUser(Map<String, dynamic> data) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(data);

      return DataState<UserModel>.success(UserModel.fromJson(user as Map<String, dynamic>));
    } catch (e) {
      return DataState<UserModel>.failure(AppException(e).handleError);
    }
  }

  @override
  Future<DataState<void>> logoutUser() async {
    try {
      await auth.logoutUser();
      return DataState<void>.success(null);
    } catch (e) {
      return DataState<void>.failure(AppException(e).handleError);
    }
  }
}
