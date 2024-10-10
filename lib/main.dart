import 'package:chat_bubbles/src/core/services/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'src/core/config/injector.dart';
import 'src/core/config/l10n/generated/l10n.dart';
import 'src/core/services/router_service.dart';
import 'src/core/utils/enums.dart';

void main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final setting = SettingService();
    return OverlaySupport.global(
      child: ListenableBuilder(
        listenable: setting,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: S.current.app_name,
            theme: setting.theme.theme,
            darkTheme: setting.theme.theme,
            themeMode: SettingService.stateMod,
            locale: setting.locale,
            initialRoute: AppRoute.splash.route,
            onGenerateRoute: RouterService().onGenerateRoute,
            localizationsDelegates: const [
              S.delegate,
              AppLocalizationDelegate(),
            ],
          );
        },
      ),
    );
  }
}
