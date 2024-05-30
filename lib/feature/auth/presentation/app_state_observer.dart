import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/feature/auth/application/app_controller.dart';
import 'package:kliq_movies/feature/dashboard/dashboard_screen.dart';

@RoutePage()
class AppStateObserverScreen extends HookConsumerWidget {
  const AppStateObserverScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appData = ref.watch(appControllerProvider);
    return Scaffold(
      body: Center(
        child: appData.map(
          data: (data) {
            return const DashboardScreen();
          },
          error: (error) {
            return const DashboardScreen();
          },
          loading: (_) => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
