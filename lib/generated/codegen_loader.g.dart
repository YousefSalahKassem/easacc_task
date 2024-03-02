// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "appName": "Easacc",
  "errors": {
    "error": "حدث خطا!",
    "no_user_found_with_this_email": "لم يتم العثور على مستخدم بهذا البريد الإلكتروني",
    "user_not_found": "لم يتم العثور على المستخدم",
    "unknown_error": "خطأ غير معروف",
    "required": "مطلوب",
    "email_already_in_use": "البريد الإلكتروني مستخدم بالفعل",
    "try_again": "حاول مرة أخرى"
  },
  "success": {
    "success": "تهانينا!",
    "login_success": "تم تسجيل الدخول بنجاح !"
  },
  "common": {
    "loading": "! برجاء الانتظار",
    "cancel": "إلغاء",
    "others": "آخر"
  },
  "profile": {
    "logout": "تسجيل الخروج",
    "logoutMessage": "هل أنت متأكد أنك تريد تسجيل الخروج؟"
  }
};
static const Map<String,dynamic> en = {
  "appName": "Easacc",
  "errors": {
    "error": "Error occurred !",
    "no_user_found_with_this_email": "No user found with this email",
    "user_not_found": "User not found",
    "unknown_error": "Unknown error",
    "required": "Required",
    "email_already_in_use": "Email already in use",
    "weak_password": "Weak password",
    "try_again": "Try again"
  },
  "success": {
    "success": "Congratulations !",
    "login_success": "Login successfully !"
  },
  "common": {
    "loading": "Loading !",
    "cancel": "Cancel",
    "others": "Other"
  },
  "profile": {
    "logout": "Logout",
    "logoutMessage": "Are you sure you want to logout ?"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
