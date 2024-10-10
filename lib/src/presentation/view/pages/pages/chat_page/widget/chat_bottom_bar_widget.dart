import 'package:chat_bubbles/src/core/utils/enums.dart';
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../common/decoration_field.dart';
import '../../../../common/generic_text_field.dart';

class ChatBottomBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSendMessage;
  final Function(String? message) onWrite;
  const ChatBottomBarWidget({super.key, required this.controller, required this.onSendMessage, required this.onWrite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.sizeSide.width,
      height: 72,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: .045.space(context)),
      color: ThemeColor.cardPrimary.color,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              child: GenericTextField(
                controller: controller,
                lines: 4,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                onChanged: onWrite,
                decorationField: DecorationField(
                    hintText: 'Type a message',
                    isBorder: false,
                    backgroundColor: ThemeColor.base.color,
                    fillBackgroundColor: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                    radiusBorder: 16),
              ),
            ),
          ),
          IconButton(
              onPressed: onSendMessage,
              icon: Icon(
                Icons.send,
                color: ThemeColor.successColor.color,
              )),
        ],
      ),
    );
  }
}
