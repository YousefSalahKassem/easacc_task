import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easacc_task/core/utilities/extensions.dart';
import 'package:easacc_task/generated/locale_keys.g.dart';

mixin UiAlerts {
  static void logoutDialog(
    BuildContext context, {
    required void Function()? onLogout,
  }) {
    showCupertinoDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            LocaleKeys.profile_logout.tr(),
          ),
          content: Text(
            LocaleKeys.profile_logoutMessage.tr(),
          ),
          actions: [
            TextButton(
              onPressed: () => context.router.pop(),
              child: Text(
                LocaleKeys.common_cancel.tr(),
                style: context.appTextStyles.bodyMedium.copyWith(
                  color: context.appTheme.black,
                ),
              ),
            ),
            TextButton(
              onPressed: onLogout,
              child: Text(
                LocaleKeys.profile_logout.tr(),
                style: context.appTextStyles.bodyMedium.copyWith(
                  color: context.appTheme.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
