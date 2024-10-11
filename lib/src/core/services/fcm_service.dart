// Flutter imports:
import 'dart:async';
import 'dart:convert';
import 'dart:io';

// Package imports:
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart' show BuildContext, GlobalKey, NavigatorState;
import 'package:overlay_support/overlay_support.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

// Project imports:
import '../../../credinitial_google_service.dart';
import '../../presentation/view/common/overlay_alert.dart';
import '../../presentation/view/common/overlay_body_widget.dart';
import '../config/injector.dart';
import '../utils/app_logger.dart';
import '../utils/enums.dart';
import '../utils/extension.dart';
import 'service_interface.dart';

@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {}

class FcmService implements ServiceInterface {
  FirebaseMessaging? _firebaseMessaging;
  String? _fcmUserToken;

  late final bool notificationPermissionDenied;
  late final String _googleAccessToken;

  StreamController<RemoteMessage>? notificationStream;

  @override
  Future initializeService() async {
    await _initMessaging();
    notificationStream ??= StreamController();
    _googleAccessToken = await _getAccessToken();
    AppLogger.logDebug('$name Success initialization');
  }

  @override
  String get name => 'FCM Service';

  String? get fcmToken => _fcmUserToken;
  FirebaseMessaging? get firebaseMessaging => _firebaseMessaging;

  Future<void> _initMessaging() async {
    try {
      _firebaseMessaging = FirebaseMessaging.instance;
      // _firebaseMessaging?.setAutoInitEnabled(true);
      final bool isSupportedDevice = await _firebaseMessaging!.isSupported();

      if (isSupportedDevice) {
        final state = await _firebaseMessaging!.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );

        notificationPermissionDenied = state.authorizationStatus == AuthorizationStatus.denied;
        if (Platform.isIOS) {
          final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
          if (apnsToken.isNotNull) {
            await getFcmToken();
          }
        } else {
          await getFcmToken();
        }
      }
    } catch (e) {
      // NotifyHelper.overlayNotify(S.current.happened_error);
    }

    try {
      _firebaseMessaging?.setAutoInitEnabled(true);

      _firebaseMessaging?.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      await initializeListenMethod();
    } catch (e) {
      // NotifyHelper.overlayNotify(S.current.happened_error);
    }
  }

  Future<void> initializeListenMethod() async {
    // FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    FirebaseMessaging.onMessage.listen(onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(onMessageOpenedApp);

    RemoteMessage? initialMessage = await _firebaseMessaging?.getInitialMessage();
    _handleMessage(initialMessage);
  }

  Future<String> getFcmToken() async {
    String newToken = await _firebaseMessaging!.getToken() ?? '';
    if (newToken != _fcmUserToken) {
      _fcmUserToken = newToken;
      // UserService().updateFcmToken(newToken, notificationPermissionDenied);
    }
    if (kDebugMode) {
      AppLogger.logInfo('FCM Token: $_fcmUserToken\nNotification Permission: ${!notificationPermissionDenied}');
    }
    return _fcmUserToken!;
  }

  void onMessageOpenedApp(RemoteMessage message) {
    notificationStream?.add(message);
    _handleMessage(message, openApp: true);
  }

  void onForegroundMessage(RemoteMessage message) {
    notificationStream?.add(message);
    AppLogger.logInfo('Notification Message: ${message.toMap()}');
    final BuildContext? context = injector<GlobalKey<NavigatorState>>().currentState?.context;
    if (context != null) {
      OverlayAlert.notify(
        message: message.notification?.body ?? '',
        context: context,
        type: OverlayType.info,
        position: NotificationPosition.top,
      );
    }
  }

  void _handleMessage(RemoteMessage? message, {bool openApp = false}) {
    final BuildContext? context = injector<GlobalKey<NavigatorState>>().currentState?.context;
    if (context != null) {
      if (openApp) {
        context.nextNamed(AppRoute.chat.route, argument: message!.data['other_user']);
      }
    }
  }

  Future<String> _getAccessToken() async {
    // Define the necessary scopes for Firebase Messaging and Database access
    List<String> scopes = [
      "https://www.googleapis.com/auth/firebase.messaging",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/userinfo.email",
    ];

    // Load the service account credentials from the JSON (use your correct credentials)
    var serviceAccountCredentials = auth.ServiceAccountCredentials.fromJson(kServiceAccountInfo);

    // Obtain an authenticated HTTP client with the required scopes
    final auth.AutoRefreshingAuthClient client = await auth.clientViaServiceAccount(
      serviceAccountCredentials,
      scopes,
    );

    // Access the token
    String accessToken = client.credentials.accessToken.data;
    client.close();

    // Log and return the access token
    AppLogger.logInfo('Google Service Access Token: $accessToken');
    return accessToken;
  }

  void sendNotification(
    String? deviceToken,
    String? userName,
    String? otherUser,
  ) async {
    String endPointFirebaseCloudMessaging = 'https://fcm.googleapis.com/v1/projects/chatbubbles-c09b5/messages:send';

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {'title': 'New Message', 'body': "You have a new message from $userName"},
        'data': {"other_user": otherUser}
      }
    };

    final http.Response response = await http.post(Uri.parse(endPointFirebaseCloudMessaging),
        headers: <String, String>{'Content-Type': "application/json", 'Authorization': 'Bearer $_googleAccessToken'},
        body: jsonEncode(message));
    if (response.statusCode == 200) {
      print('Notification send successfully');
    } else {
      print('Send notification faild: ${response.statusCode}');
    }
  }

  // Singleton
  FcmService.init();
  static FcmService? _instance;
  factory FcmService() => _instance ??= FcmService.init();
}
