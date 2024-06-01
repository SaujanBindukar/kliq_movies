import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/route/app_router.dart';
import 'package:kliq_movies/core/theme/application/theme_provider.dart';
import 'package:kliq_movies/core/widgets/custom_button.dart';
import 'package:kliq_movies/feature/dashboard/bottom_nav_provider.dart';
import 'package:kliq_movies/feature/profile/application/profile_controller.dart';
import 'package:kliq_movies/feature/profile/presentation/profile_laoding_widget.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20 + MediaQuery.of(context).padding.top),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Profile',
              style: textStyle.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userData.maybeMap(
                  orElse: () => const SizedBox(),
                  loading: (_) {
                    return const ProfileLoadingWidget();
                  },
                  error: (error) => Text(error.failure.reason),
                  success: (data) {
                    final user = data.data;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              radius: 40,
                              child: Text(
                                user!.name[0].toUpperCase(),
                                style: textStyle.headlineLarge?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name.toUpperCase(),
                                style: textStyle.titleLarge,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                user.email,
                                style: textStyle.titleSmall
                                    ?.copyWith(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
                const Divider(thickness: 0.2),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Appearance',
                        style: textStyle.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dark Mode',
                            style: textStyle.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
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
                      const Divider(
                        thickness: 0.5,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Your Stats',
                        style: textStyle.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const InfoTile(),
                      const InfoTile(),
                      const InfoTile(),
                      CustomButton(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        name: 'Logout',
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        onPressed: () async {
                          ref
                              .read(bottomNavProvider.notifier)
                              .changeIndex(index: 0);
                          await FirebaseAuth.instance.signOut().then(
                            (value) {
                              context.router.popAndPush(const DashboardRoute());
                            },
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.2, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      child: const Row(
        children: [
          Icon(Icons.book_outlined),
          SizedBox(width: 4),
          Expanded(child: Text('News Category')),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
