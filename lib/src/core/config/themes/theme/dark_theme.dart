// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Project imports:
import '../../../utils/enums.dart';
import '../i_theme.dart';

class DarkTheme implements ITheme {

  @override
  String get themeName => 'Dark Theme';

  @override
  Color get scaffoldColor => appColor[ThemeColor.base]!;

  @override
  Map<ThemeColor, Color> get appColor => {
        ThemeColor.base:                    const Color(0xff121212),
        ThemeColor.reverseBase:             const Color(0xffffffff),
        ThemeColor.primary:                 const Color(0xffE34779),
        ThemeColor.secondary:               const Color(0xff048067),
        ThemeColor.textPrimary:             const Color(0xffffffff),
        ThemeColor.textAccent:              const Color(0xffB5B5B5),
        ThemeColor.textSecondary:           const Color(0xffFFFEFE),

        ThemeColor.cardPrimary:             const Color(0xff191919),
        ThemeColor.cardSecondary:           const Color(0xff303030),

        ThemeColor.successColor:            const Color(0xFF43A048),
        ThemeColor.errorColor:              const Color(0xFFF80606),
        ThemeColor.warningColor:            const Color(0xFFFB8A00),
      };

   @override
  ThemeMode get mode => ThemeMode.dark;

  @override
  ThemeData themeData() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: scaffoldColor),
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
      listTileTheme: ListTileThemeData(
        tileColor: appColor[ThemeColor.cardPrimary],
      ),
      scaffoldBackgroundColor: scaffoldColor,
      cardColor: appColor[ThemeColor.cardPrimary],
      //Text Theme
      textTheme: getTextTheme(appColor[ThemeColor.reverseBase]!),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: appColor[ThemeColor.textPrimary], overlayColor: appColor[ThemeColor.primary]),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: appColor[ThemeColor.secondary], overlayColor: appColor[ThemeColor.primary]),
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
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: appColor[ThemeColor.base],
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true,
      );

  TextTheme getTextTheme(Color textColor) {
    return TextTheme(
      headlineSmall: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 18,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      headlineMedium: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      headlineLarge: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 28,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      bodyLarge: TextStyle(
        color: textColor,
        fontSize: 16,
        // height: 1.2,
        // letterSpacing: .2,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      bodyMedium: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      bodySmall: TextStyle(
        color: textColor,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      labelMedium: TextStyle(
        color: textColor,
        fontSize: 10,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
      labelSmall: TextStyle(
        color: textColor,
        fontSize: 8,
        fontFamily: "Inter",
        overflow: TextOverflow.visible,
      ),
    );
  }
  
  @override
  Color get defaultTextColor => appColor[ThemeColor.reverseBase]!;
}
