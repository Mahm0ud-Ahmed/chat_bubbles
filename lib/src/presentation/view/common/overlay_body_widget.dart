// Flutter imports:
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/presentation/view/common/text_widget.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:overlay_support/overlay_support.dart';

import '../../../core/services/setting_service.dart';
import '../../../core/utils/enums.dart';
import 'ticker_widget.dart';

// Project imports:

enum OverlayType {
  info({'en': 'Info', 'ar': 'تنبيه'}),
  success({'en': 'success', 'ar': 'عملية ناجحة'}),
  error({'en': 'Error', 'ar': 'خطأ'}),
  warning({'en': 'Warning', 'ar': 'تحذير'});

  final Map<String, String> type;

  const OverlayType(this.type);
}

class OverlayBodyWidget extends StatelessWidget {
  final String message;
  final OverlayType type;
  final NotificationPosition position;
  final DismissDirection? dismissDirection;
  final int secondDuration;

  const OverlayBodyWidget({
    super.key,
    required this.message,
    required this.type,
    required this.position,
    required this.secondDuration,
    this.dismissDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0.02.space(context)),
      child: SlideDismissible(
        direction: dismissDirection,
        key: UniqueKey(),
        child: SafeArea(
          bottom: position == NotificationPosition.bottom,
          top: position == NotificationPosition.top,
          child: SizedBox(
            width: context.sizeSide.smallSide,
            height: 56,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: _getAlertColor(type),
                borderRadius: BorderRadiusDirectional.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _getAlertIcon(type),
                    0.03.space(context).w,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: type.type[SettingService().locale.languageCode]!,
                            style: context.bodyS?.copyWith(color: Colors.white),
                          ),
                          TickerWidget(
                              child: TextWidget(
                            text: message,
                            style: context.bodyM?.copyWith(color: ThemeColor.base.color),
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Color _getAlertColor(OverlayType type) {
    switch (type) {
      case OverlayType.info:
        return Colors.blue;
      case OverlayType.success:
        return Colors.green;
      case OverlayType.error:
        return Colors.red;
      case OverlayType.warning:
        return Colors.orange.shade400;
    }
  }

  static Icon _getAlertIcon(OverlayType type) {
    switch (type) {
      case OverlayType.info:
        return const Icon(
          FontAwesomeIcons.circleInfo,
          color: Colors.white,
        );
      case OverlayType.success:
        return const Icon(
          FontAwesomeIcons.solidCircleCheck,
          color: Colors.white,
        );
      case OverlayType.error:
        return const Icon(
          FontAwesomeIcons.solidCircleXmark,
          color: Colors.white,
        );
      case OverlayType.warning:
        return const Icon(
          FontAwesomeIcons.triangleExclamation,
          color: Colors.white,
        );
    }
  }
}
