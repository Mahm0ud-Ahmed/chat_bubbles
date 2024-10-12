import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/core/utils/page_controller.dart';
import 'package:flutter/material.dart' show BuildContext, FormState, GlobalKey, TextEditingController, ValueNotifier;

import '../../../../../../core/config/injector.dart';
import '../../../../../../core/services/user_service.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../../data/models/user_model.dart';
import '../../../../../assistant/api_data_state.dart';
import '../../../../common/overlay_alert.dart';
import '../../../../common/overlay_body_widget.dart';

class LoginController implements AppPageController {
  late final ValueNotifier<bool> secureNotifier;
  late final TextEditingController email;
  late final TextEditingController password;
  late final GlobalKey<FormState> formKey;
  late final UserService userService;

  @override
  void initDependencies({BuildContext? context}) {
    secureNotifier = ValueNotifier<bool>(true);
    email = TextEditingController();
    password = TextEditingController();
    formKey = GlobalKey<FormState>();
    userService = injector<UserService>();
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      userService.authCubit?.login({'email': email.text, 'password': password.text});
    }
  }

  void listenOnLogin(BuildContext context, ApiDataState<UserModel> state) {
    state.mapOrNull(
      error: (value) => OverlayAlert.notify(message: value.error!.statusMessage!, context: context, type: OverlayType.error),
      success: (value) async {
        await UserService.storeUserData(value.response!);
        context.nextNamedAndRemoveUntil(AppRoute.allChats.route, (p0) => false);
      },
    );
  }

  @override
  void disposeDependencies({BuildContext? context}) {
    secureNotifier.dispose();
    email.dispose();
    password.dispose();
  }
}
