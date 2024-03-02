import 'package:auto_route/auto_route.dart';
import 'package:easacc_task/core/components/app_dialog.dart';
import 'package:easacc_task/core/components/drop_down_field.dart';
import 'package:easacc_task/core/components/text_input_field.dart';
import 'package:easacc_task/core/routes/router.dart';
import 'package:easacc_task/core/utilities/enums.dart';
import 'package:easacc_task/core/utilities/extensions.dart';
import 'package:easacc_task/core/utilities/locale.dart';
import 'package:easacc_task/core/utilities/logic_helpers.dart';
import 'package:easacc_task/core/utilities/ui_alerts.dart';
import 'package:easacc_task/core/utilities/validations.dart';
import 'package:easacc_task/features/authentication/providers/auth_provider.dart';
import 'package:easacc_task/features/settings/providers/url_holder_provider.dart';
import 'package:easacc_task/features/settings/providers/url_notifier.dart';
import 'package:easacc_task/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

part '../widgets/input_url_widget.dart';

part '../widgets/networks_drop_down.dart';

part '../widgets/logout_button.dart';

part '../widgets/language_switcher.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        key: ValueKey(context.locale),
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
              const _LanguageSwitcher(),
              20.verticalSpace,
              const _LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
