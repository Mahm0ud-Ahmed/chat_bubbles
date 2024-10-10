import 'package:chat_bubbles/src/data/remote/firebase_authentication.dart';
import 'package:chat_bubbles/src/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/user_model.dart';
import '../../../../data/repositories/interfaces/i_remote_repository.dart';
import '../../../view_model/api_data_state.dart';

class AuthCubit extends Cubit<ApiDataState<UserModel>> {
  late final IRemoteRepository _authRepository;
  AuthCubit() : super(const ApiDataIdle()) {
    _authRepository = AuthRepositoryImp(auth: FirebaseAuthentication());
  }

  Future<void> register(Map<String, dynamic> data) async {
    emit(const ApiDataLoading());
    var result = await _authRepository.registerUser(data);
    result.when(
      success: (data) => emit(ApiDataSuccessModel(response: data)),
      failure: (error) => emit(ApiDataError(error: error)),
    );
  }

  Future<void> login(Map<String, dynamic> data) async {
    emit(const ApiDataLoading());
    var result = await _authRepository.loginUser(data);
    result.when(
      success: (data) => emit(ApiDataSuccessModel(response: data)),
      failure: (error) => emit(ApiDataError(error: error)),
    );
  }

  Future<void> logout() async {
    emit(const ApiDataLoading());
    var result = await _authRepository.logoutUser();
    result.when(
      success: (data) => emit(ApiDataSuccessModel(response: null)),
      failure: (error) => emit(ApiDataError(error: error)),
    );
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    emit(const ApiDataLoading());
    final response = await _authRepository.updateUser(data);
    response.when(
      success: (data) => emit(ApiDataSuccessModel(response: data)),
      failure: (error) => emit(ApiDataError(error: error)),
    );
  }
}
