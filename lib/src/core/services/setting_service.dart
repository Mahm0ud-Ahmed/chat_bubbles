// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../config/l10n/generated/l10n.dart';
import '../config/themes/i_theme.dart';
import '../config/themes/theme/theme_manager.dart';
import '../utils/app_logger.dart';
import 'service_interface.dart';

class SettingService extends ChangeNotifier implements ServiceInterface {
  @override
  String get name => "Setting Service [Theme - Language]";

  ThemeManager? _theme;

  ThemeManager get theme => _theme!;

  Locale locale = Locale('en');

  @override
  Future<void> initializeService() async {
    _theme ??= ThemeManager();
    await _theme?.load();
    await S.load(locale);

    AppLogger.logDebug('$name Success initialization');
    AppLogger.logInfo('Theme is: $stateMod');
  }

  static ThemeMode get stateMod => ThemeManager.mode;
  static bool get isDark => ThemeManager.mode == ThemeMode.dark;

  void changeTheme({required ITheme theme}) async {
    final result = await _theme!.saveTheme(theme);
    if (result) {
      _theme?.initTheme();

      notifyListeners();
    }
    AppLogger.logInfo('Theme is: ${_theme!.currentTheme.themeName}');
  }

  // singleton
  SettingService._init();
  static SettingService? _instance;
  factory SettingService() => _instance ??= SettingService._init();
}
