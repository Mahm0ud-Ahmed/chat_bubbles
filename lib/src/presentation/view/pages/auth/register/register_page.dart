// Flutter imports:
import 'dart:io';

import 'package:chat_bubbles/src/core/services/pick_image_helper.dart';
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/presentation/view/common/app_indicator.dart';
import 'package:chat_bubbles/src/presentation/view/common/generic_text_field.dart';
import 'package:chat_bubbles/src/presentation/view/common/overlay_alert.dart';
import 'package:chat_bubbles/src/presentation/view/common/text_widget.dart';
import 'package:chat_bubbles/src/presentation/view/pages/auth/auth_cubit.dart';
import 'package:chat_bubbles/src/presentation/view/pages/auth/register/register_controller.dart';
import 'package:chat_bubbles/src/presentation/assistant/api_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/layout/responsive_layout.dart';
import '../../../../../data/models/user_model.dart';
import '../../../common/decoration_field.dart';
import '../../../common/overlay_body_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterController controller;
  @override
  void initState() {
    super.initState();
    controller = RegisterController()..initDependencies();
  }

  @override
  void dispose() {
    controller.disposeDependencies();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        showAppBar: true,
        titleAppBar: 'Register',
        builder: (context, info) {
          return BlocListener<AuthCubit, ApiDataState<UserModel>>(
            bloc: controller.userService.authCubit,
            listener: controller.listenOnRegister,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(text: 'Sign Up', style: context.headlineM),
                  .05.space(context).h,
                  Center(
                    child: SizedBox(
                      width: .25.space(context),
                      height: .25.space(context),
                      child: InkWell(
                        onTap: () async {
                          final file = await PickImageHelper().pick();
                          if (file != null) {
                            controller.avatarNotifier.value = file;
                          }
                        },
                        borderRadius: BorderRadius.circular(100),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: ThemeColor.primary.color,
                              width: 2,
                            ),
                          ),
                          child: ValueListenableBuilder(
                            valueListenable: controller.avatarNotifier,
                            builder: (context, file, _) {
                              if (file != null) {
                                return ClipOval(
                                  child: Image.file(
                                    File(file.path),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              } else {
                                return Icon(FontAwesomeIcons.user, size: .1.space(context));
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  .05.space(context).h,
                  GenericTextField(
                    controller: controller.userName,
                    validator: (value) => controller.validateUserName,
                    decorationField: DecorationField(
                      prefixIcon: Icon(FontAwesomeIcons.user),
                      hintText: 'Enter your Name',
                      labelText: 'User Name',
                    ),
                  ),
                  .03.space(context).h,
                  GenericTextField(
                    controller: controller.email,
                    validator: (value) => value.validateEmail,
                    decorationField: DecorationField(
                      prefixIcon: Icon(FontAwesomeIcons.envelope),
                      hintText: 'Enter your email',
                      labelText: 'email',
                    ),
                  ),
                  .03.space(context).h,
                  ValueListenableBuilder(
                      valueListenable: controller.passwordNotifier,
                      builder: (context, value, _) {
                        return GenericTextField(
                          obscureText: value,
                          controller: controller.password,
                          validator: (value) => value.validatePassword,
                          decorationField: DecorationField(
                            prefixIcon: Icon(FontAwesomeIcons.lock),
                            hintText: 'Enter Your Password',
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.passwordNotifier.value = !controller.passwordNotifier.value;
                              },
                              icon: Icon(value ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye),
                            ),
                          ),
                        );
                      }),
                  .03.space(context).h,
                  ValueListenableBuilder(
                      valueListenable: controller.rePasswordNotifier,
                      builder: (context, value, _) {
                        return GenericTextField(
                          obscureText: value,
                          controller: controller.rePassword,
                          validator: (value) => controller.validateRePassword(value, controller.password.text),
                          decorationField: DecorationField(
                            prefixIcon: Icon(FontAwesomeIcons.lock),
                            hintText: 'Re-Password',
                            labelText: 'Re-Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.rePasswordNotifier.value = !controller.rePasswordNotifier.value;
                              },
                              icon: Icon(value ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye),
                            ),
                          ),
                        );
                      }),
                  .05.space(context).h,
                  BlocBuilder<AuthCubit, ApiDataState<UserModel>>(
                    bloc: controller.userService.authCubit,
                    builder: (context, state) {
                      return state.maybeMap(
                        loading: (_) => AppIndicator(),
                        error: (error) => ElevatedButton(
                          onPressed: registerAction,
                          style: ElevatedButton.styleFrom(minimumSize: Size(1.space(context), 56)),
                          child: TextWidget(text: 'Sign Up'),
                        ),
                        orElse: () => ElevatedButton(
                          onPressed: registerAction,
                          style: ElevatedButton.styleFrom(minimumSize: Size(1.space(context), 56)),
                          child: TextWidget(text: 'Sign Up'),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  void registerAction() {
    if (controller.avatarNotifier.value != null) {
      controller.register();
    } else {
      OverlayAlert.notify(message: 'Add your Photo', context: context, type: OverlayType.error);
    }
  }
}
