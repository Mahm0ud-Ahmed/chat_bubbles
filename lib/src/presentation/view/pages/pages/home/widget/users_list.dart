import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/data_state.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../data/models/user_model.dart';
import '../../../../common/app_indicator.dart';
import '../../../../common/image_widget.dart';
import '../../../../common/text_widget.dart';
import '../home_cubit.dart';

class UsersList extends StatelessWidget {
  final HomeCubit<UserModel> chat;
  const UsersList({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DataState<List<UserModel>>>(
      stream: chat.getUsers(),
      builder: (BuildContext context, AsyncSnapshot<DataState<List<UserModel>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AppIndicator();
        } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
          return TextWidget(text: snapshot.error.toString());
        }
        final data = snapshot.data;
        return data!.when(
          success: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final user = data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Stack(
                      children: [
                        ClipOval(
                          child: ImageWidget(image: user.avatar, width: 50, height: 50),
                        ),
                        if (user.onlineStatus!)
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
                    title: TextWidget(text: user.userName),
                    subtitle: TextWidget(text: user.email),
                    onTap: () => context.nextNamed(AppRoute.chat.route, argument: user.uid),
                  ),
                );
              },
            );
          },
          failure: (value) => TextWidget(text: value.statusMessage ?? ''),
        );
      },
    );
  }
}
