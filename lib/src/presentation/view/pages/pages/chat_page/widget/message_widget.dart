import 'package:chat_bubbles/src/core/utils/enums.dart';
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/presentation/view/common/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../data/models/message_model.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel message;
  final bool meIsSender;

  const MessageWidget({super.key, required this.message, required this.meIsSender});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: meIsSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(
            top: 6, bottom: 6, left: meIsSender ? .25.space(context) : 0, right: !meIsSender ? .1.space(context) : 0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: meIsSender ? ThemeColor.secondary.color : ThemeColor.cardPrimary.color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: meIsSender ? Radius.circular(12) : Radius.circular(0),
                bottomRight: meIsSender ? Radius.circular(0) : Radius.circular(12),
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: message.message,
                  overflow: TextOverflow.visible,
                ),
                .03.space(context).h,
                TextWidget(
                  text: message.timestamp.toString(),
                  style: context.labelM,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
