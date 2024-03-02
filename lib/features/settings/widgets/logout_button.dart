part of '../screens/settings_screen.dart';

class _LogoutButton extends ConsumerWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(AuthProvider.provider, (previous, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.isSuccess) {
        context.loaderOverlay.hide();
        context.router.navigate(
          const LoginRoute(),
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

    return ListTile(
      onTap: () {
        UiAlerts.logoutDialog(
          context,
          onLogout: () {
            authController.signOut();
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
