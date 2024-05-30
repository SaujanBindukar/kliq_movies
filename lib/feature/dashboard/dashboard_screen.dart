import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/feature/auth/application/app_controller.dart';
import 'package:kliq_movies/feature/dashboard/bottom_nav_provider.dart';
import 'package:kliq_movies/feature/favourite/favourite_screen.dart';
import 'package:kliq_movies/feature/home/presentation/home_screen.dart';
import 'package:kliq_movies/feature/profile/profile_screen.dart';

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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          ref.read(bottomNavProvider.notifier).changeIndex(index: value);
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          if (currentUser is BaseSuccess)
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            )
        ],
      ),
      body: body[index],
    );
  }
}
