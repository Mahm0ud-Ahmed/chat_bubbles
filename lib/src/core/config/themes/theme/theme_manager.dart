import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../services/storage_service.dart';
import '../../../utils/constant.dart';
import '../../../utils/enums.dart';
import '../../injector.dart';
import '../i_theme.dart';
import 'dark_theme.dart';
import 'light_theme.dart';

class ThemeManager extends ChangeNotifier {
  static late ITheme _theme;
  static late ThemeData _themeData;
  static late ThemeMode _mode;
  bool? _isDark;
  final StorageService _storage = injector<StorageService>();

  late Map<ThemeColor, Color> appColor;
  // late Map<ThemeTextStyle, TextStyle> appStyle;

  ITheme get currentTheme => _theme;

  void load() {
    // CustomLogger.logInfo(SettingService().currentLanguage.info);
    _getPlatformTheme();

    _initialCurrentThemeApp();
    appColor = _theme.appColor;
    // appStyle = _theme.appStyle;
    _setThemeData();
    _setSystemStatusDefaultColor();

    notifyListeners();
  }

  void _getPlatformTheme([bool? isDark]) async {
    bool? darkMode = isDark;
    if (darkMode != null) {
      _isDark = darkMode;
    } else {
      darkMode = await _storage.getBool(kThemeModeKey);
      if (darkMode != null) {
        _getPlatformTheme(darkMode);
      } else {
        // final brightness = PlatformDispatcher.instance.platformBrightness;
        const brightness = Brightness.light;
        brightness == Brightness.dark ? _getPlatformTheme(true) : _getPlatformTheme(false);
      }
    }
  }

  void changeThemeMode(ITheme theme) {
    // _getPlatformTheme(!_isDark);
    _isDark = theme is DarkTheme;
    _initialCurrentThemeApp();
    _theme = theme;
    appColor = theme.appColor;
    // appStyle = theme.appStyle;
    _setThemeData();
    _setSystemStatusDefaultColor();
    _saveCurrentTheme(isDark: _isDark!);
    notifyListeners();
  }

  void _initialCurrentThemeApp() {
    if (_isDark != null && _isDark!) {
      _theme = DarkTheme();
      _mode = ThemeMode.dark;
    } else {
      _theme = LightTheme();
      _mode = ThemeMode.light;
    }
  }

  Future<void> _saveCurrentTheme({required bool isDark}) async {
    await _storage.saveValue(kThemeModeKey, isDark);
  }

  static ThemeMode get mode => _mode;

  // ITheme get themes => _theme;
  static ThemeData get myTheme => _themeData;
  static bool get isLight => mode == ThemeMode.light ? true : false;

  void _setThemeData() {
    _themeData = ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: _theme.scaffoldColor),
        appBarTheme: AppBarTheme(
          backgroundColor: _theme.scaffoldColor,
          elevation: 0,
          centerTitle: true,
          foregroundColor: appColor[ThemeColor.textPrimary],
        ),
        primaryColor: _theme.scaffoldColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: appColor[ThemeColor.primary],
          selectionColor: appColor[ThemeColor.secondary],
          selectionHandleColor: appColor[ThemeColor.secondary],
        ),
        scaffoldBackgroundColor: _theme.scaffoldColor,
        cardColor: appColor[ThemeColor.cardPrimary],
        //Text Theme
        textTheme: _initTextStyle,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: appColor[ThemeColor.textPrimary], overlayColor: appColor[ThemeColor.primary]),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: appColor[ThemeColor.secondary], overlayColor: appColor[ThemeColor.primary]),
        ),
        listTileTheme: ListTileThemeData(
          tileColor: appColor[ThemeColor.cardPrimary]
        ),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: appColor[ThemeColor.secondary]!,
          onPrimary: appColor[ThemeColor.reverseBase]!,
          secondary: appColor[ThemeColor.primary]!,
          onSecondary: _theme.scaffoldColor,
          error: appColor[ThemeColor.errorColor]!,
          onError: _theme.scaffoldColor,
          surface: appColor[ThemeColor.cardPrimary]!,
          onSurface: appColor[ThemeColor.reverseBase]!,
        ));
  }

  SystemUiOverlayStyle get systemUiOverlayStyle {
    return SystemUiOverlayStyle(
      statusBarBrightness: isLight ? Brightness.light : Brightness.dark,
      statusBarColor: _theme.scaffoldColor,
      statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: _theme.scaffoldColor,
      systemNavigationBarDividerColor: _theme.scaffoldColor,
      systemNavigationBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true,
    );
  }

  SystemUiOverlayStyle copySystemUiOverlayStyle({
    Brightness? statusBarBrightness,
    Color? statusBarColor,
    Brightness? statusBarIconBrightness,
    Color? systemNavigationBarColor,
    Color? systemNavigationBarDividerColor,
    Brightness? systemNavigationBarIconBrightness,
  }) {
    return SystemUiOverlayStyle(
      statusBarBrightness: statusBarBrightness ?? systemUiOverlayStyle.statusBarBrightness,
      statusBarColor: statusBarColor ?? _theme.scaffoldColor,
      statusBarIconBrightness: statusBarIconBrightness ?? (isLight ? Brightness.dark : Brightness.light),
      systemNavigationBarColor: systemNavigationBarColor ?? systemUiOverlayStyle.systemNavigationBarColor,
      systemNavigationBarDividerColor:
          systemNavigationBarDividerColor ?? systemUiOverlayStyle.systemNavigationBarDividerColor,
      systemNavigationBarIconBrightness: systemNavigationBarIconBrightness ?? (isLight ? Brightness.dark : Brightness.light),
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true,
    );
  }

  void _setSystemStatusDefaultColor() {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  TextTheme get _initTextStyle {
    return TextTheme(
      headlineSmall: TextStyle(
        color: appColor[ThemeColor.reverseBase],
        fontWeight: FontWeight.w500,
        fontSize: 18,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      headlineMedium: TextStyle(
        color: appColor[ThemeColor.reverseBase],
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      headlineLarge: TextStyle(
        color: appColor[ThemeColor.reverseBase],
        fontWeight: FontWeight.bold,
        fontSize: 28,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      bodyLarge: TextStyle(
        color: appColor[ThemeColor.reverseBase],
        fontSize: 16,
        // height: 1.2,
        // letterSpacing: .2,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      bodyMedium: TextStyle(
        color: appColor[ThemeColor.reverseBase],
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      bodySmall: TextStyle(
        color: appColor[ThemeColor.reverseBase],
        fontWeight: FontWeight.w500,
        fontSize: 12,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      labelLarge: TextStyle(
        color: appColor[ThemeColor.reverseBase],
        fontSize: 12,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      labelMedium: TextStyle(
        color: appColor[ThemeColor.reverseBase],
        fontSize: 10,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      labelSmall: TextStyle(
        color: appColor[ThemeColor.reverseBase],
        fontSize: 8,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
    );
  }

  void setPortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void defaultOrientationMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

/*   late ITheme currentTheme;

  final StorageService _storage = injector<StorageService>();

  late ThemeData theme;
  static late ThemeMode mode;

  Future<void> load() async {
    await _getPlatformTheme();
    initTheme();
    mode = currentTheme.mode;
  }

  void initTheme() {
    theme = currentTheme.themeData();
    _setSystemStatusDefaultColor();
    mode = currentTheme.mode;
  }

  Future<void> _getPlatformTheme() async {
    bool? darkMode = await _storage.getBool(kThemeModeKey);
    if (darkMode != null) {
      currentTheme = darkMode ? DarkTheme() : LightTheme();
    } else {
      // final brightness = PlatformDispatcher.instance.platformBrightness;
      const brightness = Brightness.light;
      currentTheme = brightness == Brightness.dark ? DarkTheme() : LightTheme();
    }
  }

  Future<bool> saveTheme(ITheme newTheme) async {
    currentTheme = newTheme;
    return await _storage.saveValue(kThemeModeKey, newTheme.mode == ThemeMode.dark);
  }

  // static bool get isDark => mode == ThemeMode.dark;

  SystemUiOverlayStyle copySystemUiOverlayStyle({
    Brightness? statusBarBrightness,
    Color? statusBarColor,
    Brightness? statusBarIconBrightness,
    Color? systemNavigationBarColor,
    Color? systemNavigationBarDividerColor,
    Brightness? systemNavigationBarIconBrightness,
  }) {
    return SystemUiOverlayStyle(
      statusBarBrightness: statusBarBrightness ?? currentTheme.systemUiOverlayStyle.statusBarBrightness,
      statusBarColor: statusBarColor ?? currentTheme.systemUiOverlayStyle.statusBarColor,
      statusBarIconBrightness: statusBarIconBrightness ?? currentTheme.systemUiOverlayStyle.statusBarIconBrightness,
      systemNavigationBarColor: systemNavigationBarColor ?? currentTheme.systemUiOverlayStyle.systemNavigationBarColor,
      systemNavigationBarDividerColor:
          systemNavigationBarDividerColor ?? currentTheme.systemUiOverlayStyle.systemNavigationBarDividerColor,
      systemNavigationBarIconBrightness:
          systemNavigationBarIconBrightness ?? currentTheme.systemUiOverlayStyle.systemNavigationBarIconBrightness,
      systemNavigationBarContrastEnforced: true,
      systemStatusBarContrastEnforced: true,
    );
  }

  void _setSystemStatusDefaultColor() {
    SystemChrome.setSystemUIOverlayStyle(currentTheme.systemUiOverlayStyle);
  }

  void setPortraitMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void defaultOrientationMode() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void systemNavigationController({SystemUiMode? mode}) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  }
 */
  static ThemeManager? _instance;
  ThemeManager._init();
  factory ThemeManager() => _instance ??= ThemeManager._init();
}
