import 'package:auto_route/auto_route.dart';
import 'package:easacc_task/features/webview/widgets/web_view_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebView(url: url),
      ),
    );
  }
}
