import 'package:chat_bubbles/src/core/services/user_service.dart';
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/core/utils/page_controller.dart';
import 'package:chat_bubbles/src/data/models/user_model.dart';
import 'package:chat_bubbles/src/presentation/view_model/api_data_state.dart';
import 'package:flutter/material.dart' show BuildContext, FormState, GlobalKey, TextEditingController, ValueNotifier;
import 'package:image_picker/image_picker.dart';

import '../../../../../core/config/injector.dart';
import '../../../../../core/utils/enums.dart';
import '../../../common/overlay_alert.dart';
import '../../../common/overlay_body_widget.dart';

class RegisterController implements AppPageController {
  late final ValueNotifier<bool> passwordNotifier;
  late final ValueNotifier<bool> rePasswordNotifier;
  late final ValueNotifier<XFile?> avatarNotifier;

  late final TextEditingController email;
  late final TextEditingController userName;
  late final TextEditingController password;
  late final TextEditingController rePassword;
  late final GlobalKey<FormState> formKey;
  late final UserService userService;

  @override
  void initDependencies({BuildContext? context}) {
    passwordNotifier = ValueNotifier<bool>(true);
    rePasswordNotifier = ValueNotifier<bool>(true);
    avatarNotifier = ValueNotifier<XFile?>(null);

    email = TextEditingController();
    userName = TextEditingController();
    password = TextEditingController();
    rePassword = TextEditingController();
    formKey = GlobalKey<FormState>();
    userService = injector<UserService>();
  }

  void register() {
    if (formKey.currentState!.validate()) {
      userService.authCubit?.register({
        'email': email.text,
        'user_name': userName.text,
        'password': password.text,
        're_password': rePassword.text,
        'avatar': avatarNotifier.value,
      });
    }
  }

  String? validateRePassword(String? password, String? rePassword) {
    if (password != rePassword) {
      return 'Password not match';
    }
    return null;
  }

  String? get validateUserName {
    if (!userName.text.isNotNull) {
      return 'Please enter your name';
    }
    return null;
  }

  void listenOnRegister(BuildContext context, ApiDataState<UserModel> state) {
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
    passwordNotifier.dispose();
    rePasswordNotifier.dispose();
    email.dispose();
    password.dispose();
    rePassword.dispose();
    avatarNotifier.dispose();
    userName.dispose();
  }
}
