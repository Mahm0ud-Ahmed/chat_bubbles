import 'package:chat_bubbles/src/core/services/user_service.dart';
import 'package:chat_bubbles/src/core/utils/enums.dart';
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/core/utils/layout/responsive_layout.dart';
import 'package:chat_bubbles/src/presentation/view/common/app_indicator.dart';
import 'package:chat_bubbles/src/presentation/view/common/text_widget.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/chat_page/chat_controller.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/chat_page/widget/chat_bottom_bar_widget.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/chat_page/widget/message_widget.dart';
import 'package:chat_bubbles/src/presentation/assistant/api_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/themes/theme/theme_manager.dart';
import '../../../../../core/utils/data_state.dart';
import '../../../../../data/models/message_model.dart';
import 'chat_user_cubit.dart';
import 'widget/user_info.dart';

class ChatPage extends StatefulWidget {
  final String userId;
  const ChatPage({super.key, required this.userId});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ChatController chatController;
  @override
  void initState() {
    super.initState();
    chatController = ChatController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // get data from previous page
    if (chatController.userId == null) {
      chatController.userId = ModalRoute.of(context)?.settings.arguments as String;
      chatController.initDependencies(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      showAppBar: false,
      isPadding: false,
      systemOverlayStyle: ThemeManager().copySystemUiOverlayStyle(systemNavigationBarColor: ThemeColor.cardPrimary.color),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBar(
          backgroundColor: ThemeColor.cardPrimary.color,
          elevation: 0,
          leadingWidth: 32,
          title: UserInfoWidget(chatController: chatController),
        ),
      ),
      builder: (context, info) {
        return BlocBuilder<ChatUserCubit<String>, ApiDataState<String>>(
          bloc: chatController.chatCubit,
          builder: (context, state) {
            return state.maybeMap(
              error: (value) => Center(
                child: TextWidget(text: value.error?.statusMessage ?? ''),
              ),
              success: (value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: StreamBuilder(
                        stream: chatController.chatCubit.getChat(value.response!),
                        builder: (BuildContext context, AsyncSnapshot<DataState<List<MessageModel>>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return AppIndicator();
                          } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
                            return TextWidget(text: snapshot.error.toString());
                          }
                          final data = snapshot.data;
                          return data!.when(
                            success: (data) {
                              final editData = data.reversed.toList();
                              return ListView.builder(
                                controller: chatController.scrollController,
                                padding: EdgeInsets.symmetric(horizontal: .045.space(context)),
                                reverse: true,
                                itemCount: editData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return MessageWidget(
                                    message: editData[index],
                                    meIsSender: editData[index].senderUid == UserService.currentUser!.uid,
                                  );
                                },
                              );
                            },
                            failure: (data) => TextWidget(text: snapshot.error.toString()),
                          );
                        },
                      ),
                    ),
                    ChatBottomBarWidget(
                      controller: chatController.message,
                      onSendMessage: chatController.sendMessage,
                      onWrite: (message) {
                        if (!chatController.isTyping) {
                          chatController.updateUserTyping(true);
                        }
                        chatController.handleTypingState(message);
                      },
                    ),
                  ],
                );
              },
              orElse: () => AppIndicator(),
            );
          },
        );
      },
    );
  }
}
