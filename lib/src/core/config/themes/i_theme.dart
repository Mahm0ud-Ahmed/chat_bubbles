// Flutter imports:
import 'package:flutter/material.dart' show Color;
import 'package:flutter/services.dart';

// Project imports:
import '../../utils/enums.dart';

abstract interface class ITheme {
  ITheme._();
  Color get scaffoldColor;

  // Map<ThemeTextStyle, TextStyle> get appStyle;
  Map<ThemeColor, Color> get appColor;
}
