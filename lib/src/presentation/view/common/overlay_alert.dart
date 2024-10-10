// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:overlay_support/overlay_support.dart';

// Project imports:
import 'overlay_body_widget.dart';

class OverlayAlert {
  static OverlaySupportEntry? _notify;

  static void notify({
    required String message,
    required BuildContext context,
    required OverlayType type,
    NotificationPosition? position = NotificationPosition.bottom,
    DismissDirection? dismissDirection = DismissDirection.horizontal,
    int? secondDuration = 8,
  }) {
    if (_notify != null) {
      _notify!.dismiss();
      // OverlaySupportEntry.of(context)!.dismiss();
    }
    _notify = showOverlayNotification(
      (context) {
        return OverlayBodyWidget(
          message: message,
          position: position,
          secondDuration: secondDuration,
          type: type,
          dismissDirection: dismissDirection,
        );
      },
      position: position!,
      context: context,
      key: UniqueKey(),
      duration: Duration(seconds: secondDuration!),
    );
  }
}
