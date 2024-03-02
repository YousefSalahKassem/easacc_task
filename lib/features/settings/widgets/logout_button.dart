part of '../screens/settings_screen.dart';

class _LogoutButton extends StatelessWidget {


  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        UiAlerts.logoutDialog(
          context,
          onLogout: () {
            context.router.navigate(const LoginRoute());
          },
        );
      },
      dense: false,
      leading: Padding(
        padding: EdgeInsets.all(10.w),
        child: Icon(
          Icons.logout,
          color: context.appTheme.error,
        ),
      ),
      title: Text(
        LocaleKeys.settings_logout.tr(),
        style: context.appTextStyles.subheadMedium,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: context.appTheme.primary,
      ),
    );
  }
}
