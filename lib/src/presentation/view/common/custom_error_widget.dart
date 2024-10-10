// Flutter imports:
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../../core/utils/extension.dart';
import 'text_widget.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  final String btnTitle;
  final VoidCallback onTab;
  final bool? showImage;
  const CustomErrorWidget({
    super.key,
    required this.message,
    required this.btnTitle,
    required this.onTab,
    this.showImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showImage!) ...[
            const Icon(
              FontAwesomeIcons.screwdriverWrench,
              size: 100,
            ),
            (context.sizeSide.smallSide * 0.1).h,
          ],
          TextWidget(
            text: message,
            style: context.titleM,
            textAlign: TextAlign.center,
          ),
          (context.sizeSide.smallSide * 0.1).h,
          ElevatedButton(onPressed: onTab, child: TextWidget(text: btnTitle)),
          (context.bottomPadding).h,
        ],
      ),
    );
  }
}
