import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/data/models/conversation_model.dart';
import 'package:chat_bubbles/src/presentation/view_model/api_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/enums.dart';
import '../../../../common/app_indicator.dart';
import '../../../../common/image_widget.dart';
import '../../../../common/text_widget.dart';
import '../home_cubit.dart';

class HistoryChat extends StatefulWidget {
  final HomeCubit<ConversationModel> history;
  const HistoryChat({super.key, required this.history});

  @override
  State<HistoryChat> createState() => _HistoryChatState();
}

class _HistoryChatState extends State<HistoryChat> {
  @override
  void initState() {
    super.initState();
    widget.history.getHistoryChat();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit<ConversationModel>, ApiDataState<ConversationModel>>(
      bloc: widget.history,
      builder: (context, state) {
        return state.maybeMap(
          error: (value) => TextWidget(text: value.error?.statusMessage ?? ''),
          successList: (success) {
            return ListView.builder(
              itemCount: success.response?.length,
              itemBuilder: (context, index) {
                final conversation = success.response?[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Stack(
                      children: [
                        ClipOval(
                          child: ImageWidget(image: conversation?.user.avatar, width: 50, height: 50),
                        ),
                        if (conversation!.user.onlineStatus!)
                          Positioned(
                            bottom: 0,
                            right: 8,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: ThemeColor.successColor.color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                      ],
                    ),
                    title: TextWidget(text: conversation.user.userName),
                    subtitle: TextWidget(
                      text: conversation.lastMessage,
                      style: context.labelM?.copyWith(color: ThemeColor.textSecondary.color),
                    ),
                    onTap: () => context.nextNamed(AppRoute.chat.route, argument: conversation.user.uid),
                  ),
                );
              },
            );
          },
          orElse: () => AppIndicator(),
        );
      },
    );
  }
}
