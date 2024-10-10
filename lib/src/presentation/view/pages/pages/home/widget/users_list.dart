import 'dart:async';

import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/data_state.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../data/models/user_model.dart';
import '../../../../common/app_indicator.dart';
import '../../../../common/image_widget.dart';
import '../../../../common/text_widget.dart';
import '../home_cubit.dart';

class UsersList extends StatefulWidget {
  final HomeCubit<UserModel> chat;
  const UsersList({super.key, required this.chat});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  DataState<List<UserModel>>? data;
  String? error;
  late final StreamSubscription<DataState<List<UserModel>>> stream;

  @override
  void initState() {
    super.initState();
    stream = widget.chat.getUsers().listen(
      (event) {
        setState(() {
          data = event;
          error = null;
        });
      },
      onError: (e) {
        setState(() {
          error = e.toString();
        });
      },
    );
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Center(child: TextWidget(text: error!));
    } else if (data != null) {
      return data!.when(
        success: (success) {
          return ListView.builder(
            itemCount: success.length,
            itemBuilder: (context, index) {
              final user = success[index];
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
    }
    return const AppIndicator();
  }
}
