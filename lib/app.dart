import 'package:easacc_task/core/routes/router.dart';
import 'package:easacc_task/core/themes/app_theme.dart';
import 'package:easacc_task/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(360, 762),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return AppTheme(
          builder: (theme) {
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: GlobalLoaderOverlay(
                overlayColor: Colors.black54,
                child: MaterialApp.router(
                  onGenerateTitle: (context) {
                    return LocaleKeys.appName.tr();
                  },
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  routerConfig: _appRouter.config(),
                  theme: theme,
                  builder: (context, child) {
                    return SizedBox(
                      child: child,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
