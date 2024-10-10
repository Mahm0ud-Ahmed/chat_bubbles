// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:chat_bubbles/src/presentation/view/pages/auth/auth_cubit.dart';

import '../../data/models/user_model.dart';
import '../config/injector.dart';
import '../utils/app_logger.dart';
import '../utils/constant.dart';
import '../utils/extension.dart';
import 'service_interface.dart';
import 'storage_service.dart';

// Flutter imports:
import 'package:flutter/material.dart' show ChangeNotifier;

class UserService extends ChangeNotifier implements ServiceInterface {
  @override
  String get name => 'User Service';

  static UserModel? _user;

  static final StorageService _storage = injector<StorageService>();

  AuthCubit? authCubit;

  @override
  Future<void> initializeService() async {
    String? userData = await _storage.getString(kUserData);
    authCubit ??= AuthCubit();
    try {
      if (userData.isNotNull) {
        _user = UserModel.fromJson(jsonDecode(userData!));
      } else {
        _user = null;
      }
      AppLogger.logDebug('$name Success initialization');
      AppLogger.logInfo('User: ${_user?.toJson()}');
      notifyListeners();
    } catch (e) {
      _storage.clear();
      _user = null;
    }
  }

  static bool get isExistUser => currentUser != null;

  static set setUser(UserModel user) => _user = user;

  static Future<void> storeUserData(UserModel user) async {
    Future.wait([
      _storage.saveValue(kUserData, jsonEncode(user.toJson())),
      UserService().initializeService(),
    ]);
  }

  static Future<void> removeUserData() async {
    Future.wait([
      _storage.remove(kUserData),
      UserService().initializeService(),
    ]);
  }

  static UserModel? get currentUser => _user;

  // Singleton
  UserService.int();
  static UserService? _instance;
  factory UserService() => _instance ??= UserService.int();
}
