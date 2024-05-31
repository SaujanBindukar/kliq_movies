import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/route/app_router.dart';
import 'package:kliq_movies/core/theme/application/theme_provider.dart';
import 'package:kliq_movies/core/widgets/custom_button.dart';
import 'package:kliq_movies/feature/dashboard/bottom_nav_provider.dart';
import 'package:kliq_movies/feature/profile/application/profile_controller.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileControllerProvider.notifier).getUserDetails();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final userData = ref.watch(profileControllerProvider);
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Profile',
                style: textStyle.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Column(
                children: [
                  userData.maybeMap(
                    orElse: () => const SizedBox(),
                    loading: (_) => const CircularProgressIndicator(),
                    error: (error) => Text(error.failure.reason),
                    success: (data) {
                      final user = data.data;
                      return Column(
                        children: [
                          const Center(
                            child: CircleAvatar(
                              radius: 40,
                              child: Icon(
                                Icons.person_outline,
                                size: 40,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            user?.name ?? '',
                            style: textStyle.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user?.email ?? '',
                            style: textStyle.titleLarge,
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                  const Divider(thickness: 0.2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Dark Mode',
                          style: textStyle.titleLarge,
                        ),
                        Switch(
                          value: theme == ThemeMode.dark,
                          onChanged: (value) {
                            ref.read(themeProvider.notifier).changeTheme(
                                  isDark: value,
                                );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.2),
                  const Spacer(),
                  CustomButton(
                    backgroundColor: Colors.red,
                    name: 'Logout',
                    onPressed: () async {
                      ref
                          .read(bottomNavProvider.notifier)
                          .changeIndex(index: 0);
                      await FirebaseAuth.instance.signOut().then((value) {
                        context.router.popAndPush(const DashboardRoute());
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
