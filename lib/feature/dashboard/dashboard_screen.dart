import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/feature/auth/application/app_controller.dart';
import 'package:kliq_movies/feature/dashboard/bottom_nav_provider.dart';
import 'package:kliq_movies/feature/dashboard/salomon_bottom_bart.dart';
import 'package:kliq_movies/feature/favourite/presentation/favourite_screen.dart';
import 'package:kliq_movies/feature/home/presentation/home_screen.dart';
import 'package:kliq_movies/feature/profile/presentation/profile_screen.dart';

@RoutePage()
class DashboardScreen extends StatefulHookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final body = const [
    HomeScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(bottomNavProvider);
    final currentUser = ref.watch(appControllerProvider).asData?.value;
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: colorTheme.surface,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        currentIndex: index,
        onTap: (value) {
          //change the index of bottomNav through state notifier
          ref.read(bottomNavProvider.notifier).changeIndex(index: value);
        },
        selectedItemColor: colorTheme.primary,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite),
            title: const Text('Favourite'),
          ),
          //if the user is loggedin
          if (currentUser is BaseSuccess)
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
            )
        ],
      ),
      body: body[index],
    );
  }
}
