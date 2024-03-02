part of '../screens/settings_screen.dart';

class _LanguageSwitcher extends ConsumerWidget {
  const _LanguageSwitcher();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    void toggleLanguage(bool isArabic) {
      if (isArabic) {
        context.setLocale(AppLocale.arabic);
      } else {
        context.setLocale(AppLocale.english);
      }
    }
    return ListTile(
      title: Text(
        LocaleKeys.settings_language.tr(),
        style: context.appTextStyles.subheadMedium,
      ),
      trailing: CupertinoSwitch(
        value: !context.isArabic,
        onChanged: (value) {
          toggleLanguage(!value);
        },
        activeColor: context.appTheme.primary,
      ),
    );
  }
}
