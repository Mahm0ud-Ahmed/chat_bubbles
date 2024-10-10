import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/core/utils/page_controller.dart';
import 'package:flutter/material.dart' show BuildContext, Curves, ScrollController, TextEditingController;

import '../../../../../core/config/injector.dart';
import '../../../../../core/services/user_service.dart';
import 'chat_user_cubit.dart';

class ChatController implements AppPageController {
  late final TextEditingController message;
  late final UserService userService;
  late final ChatUserCubit<String> chatCubit;
  late final ScrollController scrollController;
  String? userId;

  @override
  void initDependencies({BuildContext? context}) {
    message = TextEditingController();
    userService = injector<UserService>();
    chatCubit = ChatUserCubit<String>()..getChatId(userId!);
    scrollController = ScrollController();
  }

  void sendMessage() {
    if (message.text.isNotNull) {
      chatCubit.sendMessage(userId!, message.text).then(
            (value) => _scrollToEnd(),
          );
      message.clear();
    }
  }

  // Method to scroll to the end of the ListView
  void _scrollToEnd() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void disposeDependencies({BuildContext? context}) {
    message.dispose();
    chatCubit.close();
    scrollController.dispose();
  }
}
