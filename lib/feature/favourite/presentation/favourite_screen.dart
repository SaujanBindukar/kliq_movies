import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/feature/favourite/application/favourite_controller.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_header.dart';
import 'package:kliq_movies/feature/home/presentation/widget/news_list_tile.dart';

class FavouriteScreen extends StatefulHookConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<FavouriteScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favouriteControllerProvider.notifier).getFavouriteNews();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favouriteData = ref.watch(favouriteControllerProvider);
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20 + MediaQuery.of(context).padding.top,
            ),
            Text(
              'Your Favourite',
              style: textStyle.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const NewsHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    favouriteData.maybeMap(
                      initial: (_) => const CircularProgressIndicator(),
                      loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      orElse: () => const SizedBox(),
                      error: (error) => Text(error.failure.reason),
                      success: (data) {
                        final newsData = data.data ?? [];
                        if (newsData.isEmpty) {
                          return const _EmptyFavouriteNews();
                        }
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: newsData.length,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final news = newsData[index];
                            return NewsListTile(
                              newsData: news,
                            );
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyFavouriteNews extends StatelessWidget {
  const _EmptyFavouriteNews();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          const Icon(Icons.hourglass_empty, size: 60),
          const SizedBox(height: 10),
          Center(
            child: Text(
              'You have no favourite news.',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
