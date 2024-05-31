import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/feature/favourite/application/favourite_controller.dart';
import 'package:kliq_movies/feature/home/presentation/news_list_tile.dart';

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
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Favourite',
                    style: textStyle.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_sharp),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: favouriteData.maybeMap(
                    initial: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    loading: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    orElse: () => const SizedBox(),
                    error: (error) => Text(error.failure.reason),
                    success: (data) {
                      final newsData = data.data ?? [];
                      if (newsData.isEmpty) {
                        return const Center(
                            child: Text('You have no favourite news.'));
                      }
                      return ListView.builder(
                        itemCount: newsData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final news = newsData[index];
                          return NewsListTile(newsData: news);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
