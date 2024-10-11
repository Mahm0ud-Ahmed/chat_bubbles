// Flutter imports:
import 'package:flutter/material.dart';
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:chat_bubbles/src/presentation/view/common/text_widget.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// Project imports:
import '../../../presentation/view/common/custom_padding.dart';
import '../constant.dart';
import 'information_page.dart';

class ResponsiveLayout extends StatefulWidget {
  final Function(BuildContext context, InformationPage info) builder;
  final Color? backgroundColor;
  final String? titleAppBar;
  final bool? isPadding;
  final bool? resizeToAvoidBottomInset;
  final bool? showAppBar;
  final bool? showAppBarActions;
  final VoidCallback? onBack;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final PreferredSizeWidget? appBar;

  const ResponsiveLayout({
    super.key,
    required this.builder,
    this.titleAppBar,
    this.backgroundColor,
    this.isPadding = true,
    this.resizeToAvoidBottomInset = true,
    this.onBack,
    this.showAppBar = true,
    this.showAppBarActions = false,
    this.systemOverlayStyle,
    this.appBar,
  }) : assert((showAppBar == true && titleAppBar != null) || showAppBar == false);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    InformationPage infoPage = InformationPage(
      screenWidth: context.sizeSide.width,
      screenHeight: context.sizeSide.height,
      bottomPadding: context.bottomPadding,
    );

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (isPop, _) {
        widget.onBack?.call();
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: widget.systemOverlayStyle ?? context.customColors.systemUiOverlayStyle,
        child: SafeArea(
          maintainBottomViewPadding: true,
          top: false,
          bottom: false,
          left: false,
          right: false,
          child: StreamBuilder<InternetConnectionStatus>(
            stream: InternetConnectionChecker().onStatusChange,
            builder: (context, snapshot) {
              if (snapshot.data == InternetConnectionStatus.disconnected) {
                return Scaffold(
                  backgroundColor: widget.backgroundColor,
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.wifi_off_rounded, size: 100, color: context.customColors.secondary),
                        TextWidget(text: 'No Internet Connection', style: context.headlineS),
                      ],
                    ),
                  ),
                );
              } else {
                return Scaffold(
                  resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                  extendBody: true,
                  backgroundColor: widget.backgroundColor,
                  appBar: widget.showAppBar!
                      ? PreferredSize(
                          preferredSize: const Size.fromHeight(kAppBarHeight),
                          child: AppBar(
                            centerTitle: false,
                            elevation: 20,
                            scrolledUnderElevation: 30,
                            title: TextWidget(text: widget.titleAppBar!),
                            systemOverlayStyle:
                                widget.systemOverlayStyle ?? context.customColors.systemUiOverlayStyle,
                          ),
                        )
                      : widget.appBar,
                  body: SafeArea(
                    maintainBottomViewPadding: true,
                    child: SizedBox(
                      height: infoPage.screenHeight,
                      width: infoPage.screenWidth,
                      child: CustomPadding(
                          top: widget.isPadding! ? infoPage.screenWidth * (context.orientationInfo.isPortrait ? 0.03 : 0.01) : 0.0,
                          start: widget.isPadding! ? infoPage.screenWidth * 0.045 : 0.0,
                          end: widget.isPadding! ? infoPage.screenWidth * 0.045 : 0.0,
                          bottom: !widget.resizeToAvoidBottomInset! ? context.viewInsets.bottom : null,
                          child: Builder(
                            builder: (context) {
                              infoPage = infoPage.copyWith(context: context);
                              return widget.builder(context, infoPage);
                            },
                          )),
                    ),
                  ),
                );
              }
              /* return Scaffold(
                resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
                extendBody: true,
                backgroundColor: widget.backgroundColor,
                appBar: widget.showAppBar!
                    ? PreferredSize(
                        preferredSize: const Size.fromHeight(kAppBarHeight),
                        child: AppBar(
                          centerTitle: false,
                          elevation: 20,
                          scrolledUnderElevation: 30,
                          title: TextWidget(text: widget.titleAppBar!),
                          systemOverlayStyle:
                              widget.systemOverlayStyle ?? context.customColors.systemUiOverlayStyle,
                        ),
                      )
                    : widget.appBar,
                body: SafeArea(
                  maintainBottomViewPadding: true,
                  child: SizedBox(
                    height: infoPage.screenHeight,
                    width: infoPage.screenWidth,
                    child: CustomPadding(
                        top: widget.isPadding! ? infoPage.screenWidth * (context.orientationInfo.isPortrait ? 0.03 : 0.01) : 0.0,
                        start: widget.isPadding! ? infoPage.screenWidth * 0.045 : 0.0,
                        end: widget.isPadding! ? infoPage.screenWidth * 0.045 : 0.0,
                        bottom: !widget.resizeToAvoidBottomInset! ? context.viewInsets.bottom : null,
                        child: Builder(
                          builder: (context) {
                            infoPage = infoPage.copyWith(context: context);
                            return widget.builder(context, infoPage);
                          },
                        )),
                  ),
                ),
              ); */
            }
          ),
        ),
      ),
    );
  }
}
