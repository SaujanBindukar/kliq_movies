import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/core/route/app_router.dart';
import 'package:kliq_movies/core/widgets/custom_shimmer.dart';
import 'package:kliq_movies/feature/auth/application/app_controller.dart';
import 'package:kliq_movies/feature/home/application/home_controller.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';

class NewsListTile extends HookConsumerWidget {
  const NewsListTile({
    super.key,
    required this.newsData,
  });

  final News newsData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 220,
      child: Row(
        children: [
          NewsImage(newsData: newsData),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        newsData.creator.isNotEmpty
                            ? newsData.creator.first
                            : 'Unknown',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      Text(
                        getTimeAgo(dateTime: newsData.pubDate),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                  Text(
                    newsData.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (newsData.description != null)
                    Text(
                      newsData.description!,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.grey,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  Footer(
                    newsData: newsData,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Footer extends ConsumerWidget {
  const Footer({
    super.key,
    required this.newsData,
  });

  final News newsData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentUser = ref.watch(appControllerProvider).asData?.value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Chip(
          color: WidgetStatePropertyAll(
            colorScheme.primary.withOpacity(0.2),
          ),
          padding: const EdgeInsets.all(2),
          label: Text(
            newsData.category.isNotEmpty
                ? newsData.category.first.toUpperCase()
                : 'Top'.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        IconButton.outlined(
          onPressed: () {
            if (currentUser is BaseSuccess) {
              ref.read(homeControllerProvider.notifier).favouriteNews(
                    news: newsData,
                  );
            } else {
              context.router.push(const LoginRoute());
            }
          },
          icon: Icon(
            newsData.isFavourite ? Icons.favorite : Icons.favorite_outline,
            color: newsData.isFavourite ? Colors.red : null,
          ),
        ),
      ],
    );
  }
}

class NewsImage extends StatelessWidget {
  const NewsImage({
    super.key,
    required this.newsData,
  });

  final News newsData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: newsData.imageUrl!,
        height: 150,
        width: 120,
        fit: BoxFit.cover,
        errorWidget: (context, _, __) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            height: 150,
            width: 120,
            child: const Icon(Icons.error),
          );
        },
        progressIndicatorBuilder: (context, url, progress) {
          return CustomShimmer(
            widget: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
              width: MediaQuery.of(context).size.width,
              height: 80,
            ),
          );
        },
      ),
    );
  }
}

String getTimeAgo({required String dateTime}) {
  final convertedTimestamp = DateTime.parse(dateTime);
  final result = GetTimeAgo.parse(convertedTimestamp);
  return result;
}
