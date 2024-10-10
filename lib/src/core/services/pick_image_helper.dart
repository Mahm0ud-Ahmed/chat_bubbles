// ignore_for_file: public_member_api_docs, sort_constructors_first

// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:chat_bubbles/src/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../presentation/view/common/dialog.dart';
import '../../presentation/view/common/overlay_alert.dart';
import '../../presentation/view/common/overlay_body_widget.dart';
import '../config/injector.dart';

class PickImageHelper {
  const PickImageHelper();

  Future<XFile?> pick() async {
    // final bool isPermission = await checkPermission();
    XFile? image;
    // if (isPermission) {
      try {
        image = await ImagePicker().pickImage(source: ImageSource.camera);
      } on PlatformException catch (e) {
        BuildContext context = injector<GlobalKey<NavigatorState>>().currentState!.context;
        if (e.code == 'invalid_image') {
          if (context.mounted) {
            OverlayAlert.notify(
              message: e.message!,
              context: context,
              type: OverlayType.error,
            );
          }
        } else if (e.code.contains("access_denied")) {
          if (context.mounted) {
            OverlayAlert.notify(
              message: e.message!,
              context: context,
              type: OverlayType.error,
            );
          }
          await showDialog();
        }
      }
    // }
    return image;
  }

  Future<bool> checkPermission() async {
    late PermissionStatus status;
    late Permission permission;
    if (Platform.isAndroid) {
      status = await Permission.accessMediaLocation.status;
      permission = Permission.accessMediaLocation;
    } else {
      return true;
    }
    if (status == PermissionStatus.denied) {
      status = await permission.request();
    } else if (status == PermissionStatus.permanentlyDenied) {
      await showDialog();
      status = await permission.status;
    }
    return status.isGranted;
  }

  Future<void> showDialog() async {
    BuildContext context = injector<GlobalKey<NavigatorState>>().currentState!.context;
    showAlertDialog(
      context: context,
      title: context.localText.alert_dialog_permission_denied_title,
      titleAcceptBtn: context.localText.button_go_device_setting_title,
      content: context.localText.alert_dialog_permission_denied_msg,
      multiActions: true,
      onDone: () async {
        context.popWidget();
        await openAppSettings();
      },
    );
  }
}
