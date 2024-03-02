import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final String url;
  final void Function(int)? onProgress;
  final void Function(String)? onPageStarted;
  final void Function(String)? onPageFinished;
  final void Function(WebResourceError)? onWebResourceError;
  final void Function(UrlChange)? onUrlChange;
  final Widget? loadingWidget;
  final Color? backgroundColor;
  final bool enableZoom;
  final FutureOr<NavigationDecision> Function(NavigationRequest)?
      onNavigationRequest;

  const WebView({
    super.key,
    required this.url,
    this.backgroundColor,
    this.enableZoom = false,
    this.loadingWidget,
    this.onProgress,
    this.onPageStarted,
    this.onPageFinished,
    this.onNavigationRequest,
    this.onUrlChange,
    this.onWebResourceError,
  });

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController _webController;
  bool isLoading = true;

  Uri _getUri(String url) {
    Uri link = Uri.parse(url);
    if (!link.hasScheme) {
      url = 'https://$url';
      link = Uri.parse(url);
    }
    return link;
  }

  @override
  void initState() {
    _webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(widget.backgroundColor ?? const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: widget.onProgress,
          onUrlChange: widget.onUrlChange,
          onPageStarted: widget.onPageStarted,
          onPageFinished: widget.onPageFinished ??
              (finish) {
                setState(() {
                  isLoading = false;
                });
              },
          onNavigationRequest: widget.onNavigationRequest,
          onWebResourceError: widget.onWebResourceError,
        ),
      )
      ..loadRequest(_getUri(widget.url));

    _webController.enableZoom(widget.enableZoom);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: _webController),
        Visibility(
          visible: isLoading,
          child: widget.loadingWidget ??
              const Center(
                child: CircularProgressIndicator(),
              ),
        ),
      ],
    );
  }
}
