import 'package:easacc_task/core/notifiers/global_state.dart';
import 'package:easacc_task/core/service/local/interface/i_simple_user_data.dart';
import 'package:easacc_task/core/utilities/app_secrets_key.dart';
import 'package:easacc_task/core/utilities/enums.dart';
import 'package:easacc_task/features/settings/providers/url_holder_provider.dart';
import 'package:easacc_task/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UrlNotifier extends StateNotifier<GlobalStates<String>> {
  static final provider =
      StateNotifierProvider<UrlNotifier, GlobalStates<String>>(
    (ref) => UrlNotifier(
      ref.watch(
        ISimpleUserData.provider(LocalDataType.simple),
      ),
      ref.watch(
        UrlHolderProvider.provider,
      ),
    ),
  );

  final ISimpleUserData _userData;
  final UrlHolderProvider _urlHolder;

  UrlNotifier(this._userData, this._urlHolder) : super(GlobalStates.initial()) {
    getUrl();
  }

  Future<void> getUrl() async {
    final result = await _userData.readString(AppSecretsKey.url);
    _urlHolder.url.text = result ?? '';
  }

  Future<void> saveUrl() async {
    if (_urlHolder.formKey.currentState!.validate()) {
      state = GlobalStates.loading();
      try {
        await _userData.writeString(
          AppSecretsKey.url,
          _urlHolder.url.text,
        );
        state = GlobalStates.success(_urlHolder.url.text);
      } catch (_) {
        state = GlobalStates.fail(
          LocaleKeys.errors_unknown_error.tr(),
        );
      }
    }
  }
}
