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
