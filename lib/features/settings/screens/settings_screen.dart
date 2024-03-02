import 'package:auto_route/auto_route.dart';
import 'package:easacc_task/core/components/app_dialog.dart';
import 'package:easacc_task/core/components/text_input_field.dart';
import 'package:easacc_task/core/notifiers/global_state.dart';
import 'package:easacc_task/core/routes/router.dart';
import 'package:easacc_task/core/utilities/enums.dart';
import 'package:easacc_task/core/utilities/extensions.dart';
import 'package:easacc_task/core/utilities/ui_alerts.dart';
import 'package:easacc_task/core/utilities/validations.dart';
import 'package:easacc_task/features/settings/providers/url_holder_provider.dart';
import 'package:easacc_task/features/settings/providers/url_notifier.dart';
import 'package:easacc_task/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

part '../widgets/input_url_widget.dart';

part '../widgets/networks_drop_down.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.settings_title.tr(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              const _NetworksDropDown(),
              20.verticalSpace,
              const _InputUrlWidget(),
              20.verticalSpace,
              _Option(
                onTap: () {
                  UiAlerts.logoutDialog(
                    context,
                    onLogout: () {
                      context.router.navigate(const LoginRoute());
                    },
                  );
                },
                icon: Icons.logout,
                title: LocaleKeys.settings_logout.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Option extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _Option({
    required this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: false,
      leading: Padding(
        padding: EdgeInsets.all(10.w),
        child: Icon(
          icon,
          color: context.appTheme.error,
        ),
      ),
      title: Text(
        title,
        style: context.appTextStyles.subheadMedium,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: context.appTheme.primary,
      ),
    );
  }
}
