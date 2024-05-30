import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/hive/hive_setup.dart';
import 'package:kliq_movies/core/route/app_router.dart';
import 'package:kliq_movies/core/theme/app_theme.dart';
import 'package:kliq_movies/core/theme/application/theme_provider.dart';
import 'package:kliq_movies/my_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    HiveSetup.initHive(),
  ]);
  runApp(
    ProviderScope(
      observers: [
        MyObserver(),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      title: 'Kliq Movies',
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: themeMode,
      routerConfig: _appRouter.config(),
    );
  }
}
