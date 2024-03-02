import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easacc_task/app.dart';
import 'package:easacc_task/core/utilities/locale.dart';
import 'package:easacc_task/generated/codegen_loader.g.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: AppLocale.locales,
        path: 'assets/translations',
        assetLoader: const CodegenLoader(),
        startLocale: AppLocale.arabic,
        fallbackLocale: AppLocale.english,
        useOnlyLangCode: true,
        child: const MyApp(),
      ),
    ),
  );
}
