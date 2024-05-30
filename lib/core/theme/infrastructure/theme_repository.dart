import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/hive/hive_box.dart';

final iThemeRepositoryProvider = Provider<IThemeRepository>((ref) {
  return ThemeRepository();
});

sealed class IThemeRepository {
  Future<void> cacheCurrentTheme({required bool isDarkMode});
  Future<bool> getCurrentTheme();
}

class ThemeRepository implements IThemeRepository {
  @override
  Future<void> cacheCurrentTheme({required bool isDarkMode}) async {
    try {
      final box = await Hive.openLazyBox<bool>(HiveBox.themeBox);
      await box.put('currentTheme', isDarkMode);
    } catch (e) {
      debugPrint('error in hive box $e');
    }
  }

  @override
  Future<bool> getCurrentTheme() async {
    try {
      final box = await Hive.openLazyBox<bool>(HiveBox.themeBox);
      final isDarkMode = box.isEmpty ? false : await box.get('currentTheme');
      return isDarkMode ?? false;
    } catch (e) {
      return false;
    }
  }
}
