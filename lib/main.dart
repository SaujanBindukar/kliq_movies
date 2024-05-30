import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/app_setup/hive/hive_setup.dart';
import 'package:kliq_movies/core/route/app_router.dart';
import 'package:kliq_movies/core/theme/app_theme.dart';
import 'package:kliq_movies/core/theme/application/theme_provider.dart';
import 'package:kliq_movies/firebase_options.dart';
import 'package:kliq_movies/my_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp.router(
      title: 'Kliq Movies',
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: themeMode,
      routerConfig: _appRouter.config(),
    );
  }
}
