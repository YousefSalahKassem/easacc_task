import 'dart:async';

import 'package:easacc_task/app.dart';
import 'package:easacc_task/core/utilities/locale.dart';
import 'package:easacc_task/firebase_options.dart';
import 'package:easacc_task/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
