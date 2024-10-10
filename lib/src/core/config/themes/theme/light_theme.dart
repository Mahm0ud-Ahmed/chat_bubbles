import 'package:flutter/material.dart';

// Flutter imports:
import 'package:flutter/services.dart';

// Project imports:
import '../../../utils/enums.dart';
import '../i_theme.dart';
import 'app_color.dart';

class LightTheme implements ITheme {
  @override
  String get themeName => 'Light Theme';

  @override
  Color get scaffoldColor => appColor[ThemeColor.base]!;

  @override
  Map<ThemeColor, Color> get appColor => {
        ThemeColor.base: const Color(0xffffffff),
        ThemeColor.reverseBase: const Color(0xff191919),
        ThemeColor.primary: const Color(0xffE34779),
        ThemeColor.secondary: const Color(0xffACE5DA),
        ThemeColor.textPrimary: const Color(0xff1F1216),
        ThemeColor.textAccent: const Color(0xffB5B5B5),
        ThemeColor.textSecondary: const Color(0xff989394),
        ThemeColor.cardPrimary: const Color(0xffF5F5F5),
        ThemeColor.cardSecondary: const Color(0xffffffff),
        ThemeColor.successColor: const Color(0xFF43A048),
        ThemeColor.errorColor: const Color(0xFFF80606),
        ThemeColor.warningColor: const Color(0xFFFB8A00),
      };

  @override
  ThemeMode get mode => ThemeMode.light;

  @override
  ThemeData themeData(TextTheme textTheme) {
    return ThemeData.light(useMaterial3: true).copyWith(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: scaffoldColor),
      extensions: [
        AppColors(
          base: appColor[ThemeColor.base]!,
          reverseBase: appColor[ThemeColor.reverseBase]!,
          primary: appColor[ThemeColor.primary]!,
          secondary: appColor[ThemeColor.secondary]!,
          textPrimary: appColor[ThemeColor.textPrimary]!,
          textAccent: appColor[ThemeColor.textAccent]!,
          textSecondary: appColor[ThemeColor.textSecondary]!,
          cardPrimary: appColor[ThemeColor.cardPrimary]!,
          cardSecondary: appColor[ThemeColor.cardSecondary]!,
          successColor: appColor[ThemeColor.successColor]!,
          errorColor: appColor[ThemeColor.errorColor]!,
          warningColor: appColor[ThemeColor.warningColor]!,
          systemUiOverlayStyle: systemUiOverlayStyle
        ),
      ],
      appBarTheme: AppBarTheme(
        backgroundColor: scaffoldColor,
        elevation: 0,
        centerTitle: true,
        foregroundColor: appColor[ThemeColor.textPrimary],
      ),
      primaryColor: scaffoldColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: appColor[ThemeColor.primary],
        selectionColor: appColor[ThemeColor.secondary],
        selectionHandleColor: appColor[ThemeColor.secondary],
      ),
      scaffoldBackgroundColor: scaffoldColor,
      cardColor: appColor[ThemeColor.cardPrimary],
      //Text Theme
      textTheme: textTheme,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: appColor[ThemeColor.textPrimary], overlayColor: appColor[ThemeColor.primary]),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: appColor[ThemeColor.secondary], overlayColor: appColor[ThemeColor.primary]),
      ),
      listTileTheme: ListTileThemeData(
        tileColor: appColor[ThemeColor.cardPrimary],
      ),
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: appColor[ThemeColor.secondary]!,
        onPrimary: appColor[ThemeColor.reverseBase]!,
        secondary: appColor[ThemeColor.primary]!,
        onSecondary: scaffoldColor,
        error: appColor[ThemeColor.errorColor]!,
        onError: scaffoldColor,
        surface: appColor[ThemeColor.cardPrimary]!,
        onSurface: appColor[ThemeColor.reverseBase]!,
      ),
    );
  }

  @override
  SystemUiOverlayStyle get systemUiOverlayStyle => SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: appColor[ThemeColor.base],
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true,
      );

  @override
  Color get defaultTextColor => appColor[ThemeColor.reverseBase]!;
}
