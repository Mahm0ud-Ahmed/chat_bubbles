// Flutter imports:
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/data/models/user_model.dart';
import 'package:chat_bubbles/src/presentation/view/common/generic_text_field.dart';
import 'package:chat_bubbles/src/presentation/view/common/text_widget.dart';
import 'package:chat_bubbles/src/presentation/view/pages/auth/auth_cubit.dart';
import 'package:chat_bubbles/src/presentation/view/pages/auth/login/controller/login_controller.dart';
import 'package:chat_bubbles/src/presentation/assistant/api_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/layout/responsive_layout.dart';
import '../../../common/app_indicator.dart';
import '../../../common/custom_rich_text.dart';
import '../../../common/decoration_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;
  @override
  void initState() {
    super.initState();
    controller = LoginController()..initDependencies();
  }

  @override
  void dispose() {
    controller.disposeDependencies();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      showAppBar: false,
      builder: (context, info) {
        return BlocListener<AuthCubit, ApiDataState<UserModel>>(
          bloc: controller.userService.authCubit,
          listener: controller.listenOnLogin,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: 'Sign In', style: context.headlineM),
                .03.space(context).h,
                CustomRichText(
                  baseText: context.localText.dont_have_account,
                  style: context.bodyL,
                  children: [
                    spanText(
                      text: context.localText.register,
                      style: context.bodyL?.copyWith(fontWeight: FontWeight.bold, color: ThemeColor.successColor.color),
                      onClick: () => context.nextNamed(AppRoute.register.route),
                    ),
                  ],
                ),
                .05.space(context).h,
                GenericTextField(
                  controller: controller.email,
                  validator: (value) => value.validateEmail,
                  decorationField: DecorationField(
                    prefixIcon: Icon(FontAwesomeIcons.envelope),
                    hintText: 'Enter your email',
                    labelText: 'Email',
                  ),
                ),
                .03.space(context).h,
                ValueListenableBuilder(
                    valueListenable: controller.secureNotifier,
                    builder: (context, value, _) {
                      return GenericTextField(
                        obscureText: value,
                        controller: controller.password,
                        validator: (value) => value.validatePassword,
                        decorationField: DecorationField(
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          prefixIcon: Icon(FontAwesomeIcons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.secureNotifier.value = !controller.secureNotifier.value;
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
                        onPressed: loginAction,
                        style: ElevatedButton.styleFrom(minimumSize: Size(1.space(context), 56)),
                        child: TextWidget(text: 'Sign In'),
                      ),
                      orElse: () => ElevatedButton(
                        onPressed: loginAction,
                        style: ElevatedButton.styleFrom(minimumSize: Size(1.space(context), 56)),
                        child: TextWidget(text: 'Sign In'),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void loginAction() {
    controller.signIn();
  }
}
