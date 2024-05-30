import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/theme/application/theme_provider.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
