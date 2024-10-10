// Flutter imports:
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Project imports:
import '../utils/app_logger.dart';
import 'service_interface.dart';

class StorageService implements ServiceInterface {
  @override
  String get name => 'Shared Preferences Service';

  FlutterSecureStorage? _preferences;

  @override
  Future initializeService() async {
    _preferences = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    );

    AppLogger.logDebug('$name Success initialization');
    return _preferences;
  }

  Future<bool> has(String key) async {
    return await _preferences!.containsKey(key: key);
  }

  // Removing
  Future<void> clear() async {
    return await _preferences!.deleteAll();
  }

  Future<void> remove(String key) async {
    return await _preferences!.delete(key: key);
  }

  // saving
  Future<bool> saveValue(String key, dynamic value) async {
    bool result = false;
    try {
      await _preferences!.write(key: key, value: value.toString());
      result = true;
    } on Exception catch (_) {
      result = false;
    }
    return result;
  }

  ///for any get operation from data storage service it's the caller responsibility to handle null cases
  Future<bool?> getBool(String key) async {
    try {
      String? value = await _preferences!.read(key: key);
      return value.isNotNull ? bool.tryParse(value!) : null;
    } on Exception catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return null;
  }

  Future<String?> getString(String key) async {
    try {
      return await _preferences!.read(key: key);
    } on Exception catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return null;
  }

  Future<int?> getInt(String key) async {
    try {
      String? value = await _preferences!.read(key: key);
      return value.isNotNull ? int.tryParse(value!) : null;
    } on Exception catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    return null;
  }

  // singleton
  StorageService.init();
  static StorageService? _instance;
  factory StorageService() => _instance ??= StorageService.init();
}
