import 'package:auto_route/auto_route.dart';
import 'package:easacc_task/features/authentication/screens/login_screen.dart';
import 'package:easacc_task/features/settings/screens/settings_screen.dart';
import 'package:easacc_task/features/webview/screens/webview_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true, path: '/'),
        CustomRoute(
          page: SettingsRoute.page,
          path: '/settings',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          page: WebViewRoute.page,
          path: '/webview',
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];
}
