import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kliq_movies/core/entities/base_state.dart';
import 'package:kliq_movies/core/route/app_router.dart';
import 'package:kliq_movies/core/widgets/custom_shimmer.dart';
import 'package:kliq_movies/feature/auth/application/app_controller.dart';
import 'package:kliq_movies/feature/home/application/home_controller.dart';
import 'package:kliq_movies/feature/home/infrastructure/models/news_response.dart';
import 'package:get_time_ago/get_time_ago.dart';

class NewsListTile extends HookConsumerWidget {
  const NewsListTile({
    super.key,
    required this.newsData,
  });

  final News newsData;

  @override
  Widget build(BuildContext context, ref) {
    final currentUser = ref.watch(appControllerProvider).asData?.value;
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
                  Row(
                    children: [
                      Text(
                        newsData.creator.isNotEmpty
                            ? newsData.category.first
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
                    currentUser: currentUser,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Footer extends ConsumerWidget {
  const Footer({
    super.key,
    required this.newsData,
    required this.currentUser,
  });

  final News newsData;
  final BaseState? currentUser;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Chip(
          padding: const EdgeInsets.all(2),
          label: Text(
            newsData.category.isNotEmpty
                ? newsData.category.first.toUpperCase()
                : 'Top'.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.grey,
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
        imageUrl: newsData.imageUrl ?? '',
        height: 150,
        fit: BoxFit.cover,
        errorWidget: (context, _, __) {
          return CustomShimmer(
            widget: Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              height: 80,
              child: const Icon(Icons.error),
            ),
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
        width: 120,
      ),
    );
  }
}

String getTimeAgo({required String dateTime}) {
  var convertedTimestamp = DateTime.parse(dateTime);
  var result = GetTimeAgo.parse(convertedTimestamp);
  return result;
}
