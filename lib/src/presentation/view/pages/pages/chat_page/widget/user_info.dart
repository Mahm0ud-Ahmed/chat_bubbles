import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/chat_page/chat_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/data_state.dart';
import '../../../../../../data/models/user_model.dart';
import '../../../../common/app_indicator.dart';
import '../../../../common/image_widget.dart';
import '../../../../common/text_widget.dart';

class UserInfoWidget extends StatelessWidget {
  final ChatController chatController;
  const UserInfoWidget({super.key, required this.chatController});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataState<UserModel>>(
      stream: chatController.chatCubit.getOtherUser(chatController.userId!),
      builder: (BuildContext context, AsyncSnapshot<DataState<UserModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppIndicator();
        } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
          return TextWidget(text: "Chat");
        }
        final data = snapshot.data;
        return data!.when(
          success: (data) {
            chatController.isTyping = data.isTyping!;
            return Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: data.onlineStatus! ? context.customColors.successColor : Colors.transparent, width: 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipOval(
                      child: ImageWidget(
                        image: data.avatar,
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                ),
                .02.space(context).w,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(text: data.userName),
                      .01.space(context).h,
                      TextWidget(
                        text: chatController.getUserState(data),
                        style: context.labelM,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          failure: (data) => TextWidget(text: "Chat"),
        );
      },
    );
  }
}
