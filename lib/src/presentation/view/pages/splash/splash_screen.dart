// Flutter imports:
import 'package:chat_bubbles/src/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import '../../../../core/config/injector.dart';
import '../../../../core/services/fcm_service.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/extension.dart';
import '../../../../core/utils/layout/responsive_layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    injector<FcmService>().initializeService();

    Future.delayed(
      const Duration(seconds: 4),
      () {
        if(UserService.isExistUser){
          context.nextReplacementNamed(AppRoute.allChats.route);
        }else {
          context.nextReplacementNamed(AppRoute.login.route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        isPadding: false,
        showAppBar: false,
        // backgroundColor: ThemeColor.base.color,
        builder: (context, info) {
          return Icon(FontAwesomeIcons.rocketchat, size: 100, color: ThemeColor.secondary.color);
        });
  }
}
