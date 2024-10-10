// Flutter imports:
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/services/setting_service.dart';

// Project imports:

AnimationController? bottomSheetAnimation;

void _initBottomSheetAnimation(TickerProvider vsync) {
  try {
    bottomSheetAnimation ??= BottomSheet.createAnimationController(vsync)..duration = const Duration(milliseconds: 750);
  } catch (e) {
    return;
  }
}

Future<T?> customBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext context, BoxConstraints constraints) builder,
  required double height,
  SystemUiOverlayStyle? systemUiOverlayStyle,
  Color? backgroundColor,
  AnimationController? controller,
  TickerProvider? vsync,
  bool? canClose = true,
  bool? canSystemPop = true,
  ShapeBorder? shape,
  bool? portraitOnly = false,
  EdgeInsetsGeometry? padding
}) async {
  if (portraitOnly!) {
    SettingService().theme.setPortraitMode();
  }
  if (vsync != null) {
    _initBottomSheetAnimation(vsync);
  }
  return showModalBottomSheet<T>(
    transitionAnimationController: controller ?? bottomSheetAnimation,
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    useSafeArea: false,
    isDismissible: canClose!,
    enableDrag: canClose,
    backgroundColor: backgroundColor,
    shape: shape,
    constraints: BoxConstraints(
      minHeight: height,
      maxHeight: context.sizeSide.largeSide,
      minWidth: context.sizeSide.width,
    ),
    builder: (context) {
      return PopScope(
        canPop: canSystemPop!,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiOverlayStyle ??
              SettingService().theme.copySystemUiOverlayStyle(
                systemNavigationBarColor: backgroundColor ?? Colors.transparent,
                // systemNavigationBarDividerColor: ThemeManager().currentTheme.scaffoldColor.last,
              ),
          child: Padding(
            padding: padding ?? EdgeInsets.only(
              left: .045.space(context),
              right: .045.space(context),
              bottom: context.viewInsets.bottom,
            ),
            child: SizedBox(
              height: height,
              child: LayoutBuilder(
                builder: builder,
              ),
            ),
          ),
        ),
      );
    },
  ).then((value) {
    if (portraitOnly) {
      SettingService().theme.defaultOrientationMode();
    }
    if (vsync != null) {
      bottomSheetAnimation?.dispose();
    }
    return value;
  });
}
