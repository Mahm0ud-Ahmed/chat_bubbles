// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../config/l10n/generated/l10n.dart';
import '../config/themes/theme/dark_theme.dart';
import '../config/themes/theme/light_theme.dart';
import '../config/themes/theme/theme_manager.dart';
import '../utils/app_logger.dart';
import '../utils/enums.dart';
import 'service_interface.dart';

class SettingService extends ChangeNotifier implements ServiceInterface {
  @override
  String get name => "Setting Service [Theme - Language]";

  final ThemeManager _theme = ThemeManager();

  ThemeManager get theme => _theme;

  Locale locale = Locale('en');

  @override
  Future<void> initializeService() async {
    await S.load(locale);
    _theme.load();

    AppLogger.logDebug('$name Success initialization');
    AppLogger.logInfo('Theme is: $stateMod');
  }

  static ThemeMode get stateMod => ThemeManager.mode;
  static bool get isDark => ThemeManager.mode == ThemeMode.dark;

/*   void changeTheme({required ITheme theme}) async {
    final result = await _theme!.saveTheme(theme);
    if (result) {
      _theme?.initTheme();

      notifyListeners();
    }
    AppLogger.logInfo('Theme is: ${_theme?.currentTheme.themeName}');
  } */

     void changeTheme({required SupportTheme theme}) {
    switch (theme) {
      case SupportTheme.dark:
        _theme.changeThemeMode(DarkTheme());
        break;
      case SupportTheme.light:
        _theme.changeThemeMode(LightTheme());
        break;
      default:
        _theme.changeThemeMode(LightTheme());
    }
    AppLogger.logInfo('Theme is: ${theme.name}');
  }

  // singleton
  SettingService._init();
  static SettingService? _instance;
  factory SettingService() => _instance ??= SettingService._init();
}
