import 'package:bloc/bloc.dart';
import 'package:chat_bubbles/src/core/services/setting_service.dart';
import 'package:chat_bubbles/src/core/services/user_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' show GlobalKey, NavigatorState, WidgetsFlutterBinding;
import 'package:get_it/get_it.dart';

import '../../../firebase_options.dart';
import '../../presentation/assistant/my_bloc_observer.dart';
import '../services/fcm_service.dart';
import '../services/storage_service.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  injector.registerSingleton<GlobalKey<NavigatorState>>(GlobalKey<NavigatorState>());

  injector.registerLazySingleton<FcmService>(() => FcmService());
  injector.registerSingleton<StorageService>(StorageService()..initializeService());
  injector.registerSingleton<SettingService>(SettingService());
  await injector<SettingService>().initializeService();

  injector.registerSingleton<UserService>(UserService());
  await injector<UserService>().initializeService();

  Bloc.observer = MyBlocObserver();
}
