import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/enums.dart';
import 'text_widget.dart';

class DialogBuilder extends StatelessWidget {
  final dynamic image;
  final Widget? header;
  final String title;
  final String? titleAcceptBtn;
  final String? titleCancelBtn;
  final String content;
  final VoidCallback onDone;
  final VoidCallback? onCancel;
  final bool? withAnimate;
  final bool multiActions;
  final double? radius;
  final Color? backgroundColor;
  const DialogBuilder({
    super.key,
    this.image,
    required this.title,
    required this.content,
    required this.onDone,
    this.withAnimate = false,
    this.radius = 12,
    this.backgroundColor,
    this.header,
    this.titleAcceptBtn,
    this.titleCancelBtn,
    this.onCancel,
    this.multiActions = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
      title: Column(
        children: [
          TextWidget(
            text: title,
            style: context.headlineM?.copyWith(color: ThemeColor.reverseBase.color, fontWeight: FontWeight.w600),
          )
        ],
      ),
      content: TextWidget(
        text: content,
        textAlign: TextAlign.center,
        style: context.bodyM?.copyWith(color: ThemeColor.reverseBase.color),
      ),
      actions: [
          OutlinedButton(
            onPressed: () {
              context.popWidget();
              onCancel?.call();
            },
            style: OutlinedButton.styleFrom(minimumSize: Size(multiActions ? .32.space(context) : 56, 56)),
            child: TextWidget(text: titleCancelBtn ?? "No"),
          ),
         
      ],
    );
  }
}
