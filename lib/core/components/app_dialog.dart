import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:easacc_task/core/utilities/enums.dart';

mixin AppDialog {
  static void show({
    required String message,
    required DialogType type,
    required BuildContext context,
  }) {
    if (type == DialogType.error) {
      ElegantNotification.error(
        animation: AnimationType.fromTop,
        description: Text(message),
      ).show(context);
    } else if (type == DialogType.success) {
      ElegantNotification.success(
        description: Text(message),
      ).show(context);
    }
  }
}
