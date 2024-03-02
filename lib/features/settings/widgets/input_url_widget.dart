part of '../screens/settings_screen.dart';

class _InputUrlWidget extends ConsumerWidget {
  const _InputUrlWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final urlHolder = ref.read(UrlHolderProvider.provider.notifier);
    final urlHolderNotifier = ref.watch(UrlHolderProvider.provider);
    final urlController = ref.read(UrlNotifier.provider.notifier);

    ref.listen(UrlNotifier.provider, (previous, next) {
      if (next.isLoading) {
        context.loaderOverlay.show();
      } else if (next.isSuccess) {
        context.loaderOverlay.hide();
        AppDialog.show(
          message: LocaleKeys.success_success.tr(),
          type: DialogType.success,
          context: context,
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
    return Form(
      key: urlHolder.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInputField(
            label: LocaleKeys.settings_url.tr(),
            hint: LocaleKeys.settings_urlHint.tr(),
            validator: (value) => value!.validate([
              validateRequired,
              validateUrl,
            ]),
            controller: urlHolder.url,
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: context.widthR(.3),
                child: ElevatedButton(
                  onPressed: () {
                    urlController.saveUrl();
                  },
                  child: Text(
                    LocaleKeys.settings_save.tr(),
                  ),
                ),
              ),
              SizedBox(
                width: context.widthR(.3),
                child: ElevatedButton(
                  onPressed: () {
                    if (urlHolderNotifier.formKey.currentState!.validate()) {
                      context.router.push(
                        WebViewRoute(url: urlHolderNotifier.url.text),
                      );
                    }
                  },
                  child: Text(
                    LocaleKeys.settings_show.tr(),
                  ),
                ),
              ),
            ],
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
