// Flutter imports:
import 'package:chat_bubbles/src/presentation/view/pages/auth/login/login_page.dart';
import 'package:chat_bubbles/src/presentation/view/pages/auth/register/register_page.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/chat_page/chat_page.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/home/home_page.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../presentation/view/pages/splash/splash_screen.dart';
import '../utils/app_logger.dart';
import '../utils/enums.dart';
import 'service_interface.dart';

class RouterService implements ServiceInterface {
  @override
  String get name => 'Router Service';

  @override
  Future<void> initializeService() async {
    AppLogger.logDebug('$name Success initialization');
  }

  static final routes = <String, Widget Function(BuildContext, {Object? arg})>{
    AppRoute.splash.route: (BuildContext context, {Object? arg}) => const SplashScreen(),
    AppRoute.login.route: (BuildContext context, {Object? arg}) => const LoginPage(),
    AppRoute.register.route: (BuildContext context, {Object? arg}) => const RegisterPage(),
    AppRoute.allChats.route: (BuildContext context, {Object? arg}) => const HomePage(),
    AppRoute.chat.route: (BuildContext context, {Object? arg}) => ChatPage(userId: arg as String),
    AppRoute.setting.route: (BuildContext context, {Object? arg}) => const SettingPage(),
  };

  var onGenerateRoute = (RouteSettings settings) {
    final String? name = settings.name;
    final Function(BuildContext, {Object? arg})? pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            settings: settings, builder: (context) => pageContentBuilder(context, arg: settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute(settings: settings, builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
  };

  // Singleton
  RouterService.int();
  static RouterService? _instance;
  factory RouterService() => _instance ??= RouterService.int();
}
