import 'package:auto_route/auto_route.dart';
import 'package:easacc_task/core/routes/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.router.push(
              const SettingsRoute(),
            );
          },
          child: Text("click"),
        ),
      ),
    );
  }
}
