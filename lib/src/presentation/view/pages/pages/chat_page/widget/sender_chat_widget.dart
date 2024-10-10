/* import 'package:flutter/material.dart';
import 'package:oranos_assessment/src/data/models/chat_model.dart';

import '../../../../core/config/themes/theme_manager.dart';

class SenderChatWidget extends StatelessWidget {
  final ChatModel chat;
  const SenderChatWidget({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: ThemeManager().appColor[5],
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      chat.message!,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: ThemeManager().appColor[6]),
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
              ),
            ),
            Icon(Icons.done_all, color: ThemeManager().appColor[3],)
          ],
        ),
      ),
    );
  }
} */