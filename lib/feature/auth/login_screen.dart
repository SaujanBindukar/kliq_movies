import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/theme/application/theme_provider.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      body: Center(
        child: Switch(
          value: theme == ThemeMode.dark,
          onChanged: (value) {
            ref.read(themeProvider.notifier).changeTheme(
                  isDark: value,
                );
          },
        ),
      ),
    );
  }
}
