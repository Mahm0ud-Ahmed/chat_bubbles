import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:chat_bubbles/src/core/utils/constant.dart';
import 'package:chat_bubbles/src/core/utils/enums.dart';

import '../config/l10n/generated/l10n.dart';
import '../config/themes/theme/app_color.dart';
import '../services/setting_service.dart';

extension SizeBox on num? {
  SizedBox get h => SizedBox(height: this?.toDouble());
  SizedBox get w => SizedBox(width: this?.toDouble());
  double space(BuildContext context) => context.sizeSide.smallSide * this!;
}

extension ContextServices on BuildContext {
  Future push(Widget page) => Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));

  FlutterView get view => View.of(this);

  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);
  Size get screenSize => MediaQuery.sizeOf(this);

  ({Orientation orientation, bool isPortrait}) get orientationInfo =>
      (orientation: MediaQuery.orientationOf(this), isPortrait: MediaQuery.maybeOrientationOf(this) == Orientation.portrait);

  double get bottomPadding => kAppBarHeight + (view.viewPadding.bottom / 2.5);

  ({double width, double height, double smallSide, double largeSide}) get sizeSide => orientationInfo.isPortrait
      ? (width: screenSize.width, height: screenSize.height, smallSide: screenSize.width, largeSide: screenSize.height)
      : (width: screenSize.width, height: screenSize.height, smallSide: screenSize.height, largeSide: screenSize.width);

  double get deviceWidth => sizeSide.smallSide > 768 ? 768 : sizeSide.smallSide;

  bool get isMobile => getDeviceScreenType == DeviceScreenType.mobile;
  bool get isTablet => getDeviceScreenType == DeviceScreenType.tablet;

  DeviceScreenType get getDeviceScreenType {
    switch (sizeSide.smallSide) {
      case <= 480:
        return DeviceScreenType.mobile;
      default:
        return DeviceScreenType.tablet;
    }
  }

  S get localText => S.of(this);

  AppColors get customColors => Theme.of(this).extension<AppColors>()!;

  TextStyle? get headlineL => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineM => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineS => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get displayL => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayM => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displayS => Theme.of(this).textTheme.displaySmall;
  TextStyle? get bodyL => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyM => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodyS => Theme.of(this).textTheme.bodySmall;
  TextStyle? get titleL => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleM => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleS => Theme.of(this).textTheme.titleSmall;
  TextStyle? get labelL => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelM => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelS => Theme.of(this).textTheme.labelSmall;

  void popWidget<T>({T? value}) => Navigator.pop<T>(this, value);
  Future<T?> nextNamed<T>(String name, {Object? argument}) async =>
      await Navigator.pushNamed(this, name, arguments: argument);
  Future<void> nextNamedAndRemoveUntil(String name, bool Function(Route<dynamic>) predicate, {Object? argument}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(name, predicate, arguments: argument);

  Future<void> nextReplacementNamed(String name, {Object? argument}) =>
      Navigator.of(this).pushReplacementNamed(name, arguments: argument);
}

extension StringServices on String? {
  bool get isNotNull => this != null && this!.isNotEmpty;

  String? get validateEmail {
    if (!isNotNull) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this!)) return 'Invalid email';
    return null;
  }

  String? get validatePassword {
    if (!isNotNull) return 'Password is required';
    if (this!.length < 6) return 'Password must be at least 6 characters';
    return null;
  }
}

extension AppColorTheme on ThemeColor {
  Color get color {
    return SettingService().theme.currentTheme.appColor[this]!;
  }
}
