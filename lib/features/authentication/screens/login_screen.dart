import 'package:auto_route/auto_route.dart';
import 'package:easacc_task/core/components/app_dialog.dart';
import 'package:easacc_task/core/routes/router.dart';
import 'package:easacc_task/core/utilities/enums.dart';
import 'package:easacc_task/features/authentication/providers/auth_provider.dart';
import 'package:easacc_task/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(AuthProvider.provider, (previous, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.isSuccess) {
        context.loaderOverlay.hide();
        AppDialog.show(
          message: LocaleKeys.success_login_success.tr(),
          type: DialogType.success,
          context: context,
        );

        context.router.navigate(
          const SettingsRoute(),
        );
      } else if (next.isFailed) {
        context.loaderOverlay.hide();
        AppDialog.show(
          message: next.error.toString(),
          type: DialogType.error,
          context: context,
        );
      }
    });
    final authController = ref.read(AuthProvider.provider.notifier);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                authController.loginWithGoogle();
              },
              child: Text(
                LocaleKeys.login_google.tr(),
              ),
            ),
            30.verticalSpace,
            ElevatedButton(
              onPressed: () {
                authController.loginWithFacebook();
              },
              child: Text(
                LocaleKeys.login_facebook.tr(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
