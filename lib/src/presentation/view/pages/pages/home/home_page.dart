import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/core/utils/layout/responsive_layout.dart';
import 'package:chat_bubbles/src/data/models/conversation_model.dart';
import 'package:chat_bubbles/src/data/models/user_model.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/home/home_cubit.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/home/widget/history_chat.dart';
import 'package:chat_bubbles/src/presentation/view/pages/pages/home/widget/users_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../setting/setting_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit<UserModel> usersCubit;
  late final HomeCubit<ConversationModel> history;
  @override
  void initState() {
    super.initState();
    usersCubit = HomeCubit<UserModel>();
    history = HomeCubit<ConversationModel>();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      // titleAppBar: 'Home',
      showAppBar: false,
      builder: (context, info) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(icon: Icon(FontAwesomeIcons.users)),
                  Tab(icon: Icon(FontAwesomeIcons.comments)),
                ],
              ),
              title: Text('Home'),
              actions: [
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.gear,
                  ),
                  onPressed: () => context.push(const SettingPage()),
                )
              ],
            ),
            body: TabBarView(
              children: [
                UsersList(chat: usersCubit),
                HistoryChat(history: history)
              ],
            ),
          ),
        );
      },
    );
  }
}
