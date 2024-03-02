part of '../screens/settings_screen.dart';

class _NetworksDropDown extends StatelessWidget with LogicHelpers {
  const _NetworksDropDown();

  @override
  Widget build(BuildContext context) {
    final options = [
      LocaleKeys.settings_wifi.tr(),
      LocaleKeys.settings_bluetooth.tr(),
    ];
    return DropDownField<String>(
      items: options,
      onChanged: (value) async {
        print(value);
        await requestOption(value??'');
      },

      label: LocaleKeys.settings_network.tr(),
      hint: LocaleKeys.settings_network.tr(),
    );
  }
}
