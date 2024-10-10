// Flutter imports:
import 'package:flutter/material.dart';

abstract interface class AppPageController {
  void initDependencies({BuildContext? context});
  void disposeDependencies({BuildContext? context});
}
