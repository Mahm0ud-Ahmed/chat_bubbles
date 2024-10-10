import 'package:chat_bubbles/src/core/config/themes/theme/dark_theme.dart';
import 'package:chat_bubbles/src/core/config/themes/theme/light_theme.dart';
import 'package:chat_bubbles/src/core/services/setting_service.dart';
import 'package:chat_bubbles/src/core/services/user_service.dart';
import 'package:chat_bubbles/src/core/utils/enums.dart';
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/core/utils/layout/responsive_layout.dart';
import 'package:chat_bubbles/src/presentation/view/common/dialog.dart';
import 'package:chat_bubbles/src/presentation/view/common/text_widget.dart';
import 'package:chat_bubbles/src/presentation/view/pages/auth/auth_cubit.dart';
import 'package:chat_bubbles/src/presentation/view_model/api_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/injector.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      titleAppBar: 'Settings',
      builder: (context, info) {
        return BlocListener<AuthCubit, ApiDataState>(
          bloc: UserService().authCubit,
          listener: (context, state) {
            state.mapOrNull(
              loading: (value) => showLoadingDialog(context),
              success: (value) async {
                await UserService.removeUserData();
                context.nextNamedAndRemoveUntil(
                  AppRoute.login.route,
                  (p0) => false,
                );
              },
              error: (value) => context.popWidget(),
            );
          },
          child: Column(
            children: [
              ListenableBuilder(
                listenable: injector<SettingService>(),
                builder: (context, _) {
                  return SwitchListTile(
                    value: SettingService.isDark,
                    title: TextWidget(text: 'Change Theme'),
                    onChanged: (value) {
                      if (value) {
                        SettingService().changeTheme(theme: DarkTheme());
                      } else {
                        SettingService().changeTheme(theme: LightTheme());
                      }
                    },
                  );
                },
              ),
              .03.space(context).h,
              ListTile(
                title: TextWidget(text: 'Logout'),
                onTap: () => UserService().authCubit?.logout(),
              ),
            ],
          ),
        );
      },
    );
  }
}
