import 'package:easacc_task/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

extension FieldValidate on String {
  String? validate(List<String? Function(String?)> functions) {
    for (final String? Function(String?) func in functions) {
      final result = func(this);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}

String? validateRequired(String? value) {
  return value!.trim().isEmpty ? LocaleKeys.errors_required.tr() : null;
}

String? validateUrl(String? value) {
  if (value == null || value.isEmpty) {
    return null; // No validation for empty values
  }

  const pattern =
      r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
  final regExp = RegExp(pattern);
  if (!regExp.hasMatch(value)) {
    return LocaleKeys.errors_try_again.tr();
  } else {
    return null;
  }
}
