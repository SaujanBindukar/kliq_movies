import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/theme/infrastructure/theme_repository.dart';

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeMode>((ref) {
  return ThemeProvider(ref: ref)..getTheme();
});

class ThemeProvider extends StateNotifier<ThemeMode> {
  ThemeProvider({
    required this.ref,
  }) : super(ThemeMode.dark);
  final Ref ref;

  void changeTheme({
    required bool isDark,
  }) async {
    await ref
        .read(iThemeRepositoryProvider)
        .cacheCurrentTheme(isDarkMode: isDark);
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void getTheme() async {
    final theme = await ref.read(iThemeRepositoryProvider).getCurrentTheme();
    state = theme ? ThemeMode.dark : ThemeMode.light;
  }
}
